//
//  LoginView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-14.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var authServices: AuthServices
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var re_password: String = ""
    
    @State private var showLoginAlert = false
    @State private var isShowRegAlert = false
    @State private var errorDescription: String = ""
    
    @State private var isShowReg = false
    @State private var isShowMainTab = false
    
    var body: some View {
        ZStack {
            fullBackground(imageName: "backYellow")
            VStack {
                Spacer()
                Image("logoYellow_New")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 210)
                Spacer()
                VStack(spacing: 20) {
                    EmailTextFieldView(email: $email)
                    PasswordTextFieldView(password: $password)
                    if isShowReg {
                        RePasswordTextFieldView(re_password: $re_password)
                    }
                    LoginButtonView(label: isShowReg ? "sign up" : "login") {
                        authenticate()
                        if isShowReg {
                            validateFields()
                        }
                    }
                    GuestButtonView(label: "continue as guest") {
                        print("Guest button tapped!!!")
                        isShowMainTab.toggle()
                    }

                    HStack {
                        Button(isShowReg ? "back to login" : "register") {
                            
                            isShowReg.toggle()
                        }
                        Spacer()
                        Button("forgot password?") {
                            forgotButtonTapped()
                        }
                    } .foregroundStyle(Color("textColor"))
                } .padding(40)
            }
        }
        .fullScreenCover(isPresented: $isShowMainTab) { MainTabView() }
        .alert(isPresented: self.$showLoginAlert) { Alert(title: Text("Error..."), message: Text(isShowRegAlert ? "Please enter the same password in the \"password\" and \"confirm password\" fields" : "\(errorDescription)"), dismissButton: .default(Text("OK"))) }
    }
    
    func validateFields() {
        
        if password != re_password {

            isShowRegAlert = true
        } else {
            isShowRegAlert = false
        }
    }
    
    func authenticate() {
        
        Task {
            do {
                if isShowReg {
                    if isShowRegAlert {
                        showLoginAlert.toggle()
                    } else {
                        try await authServices.signUp(email, password: password)
                    }
                } else {
                    try await authServices.login(email: email, password: password)
                }
            } catch {
                print(error.localizedDescription)
                errorDescription = error.localizedDescription
                showLoginAlert.toggle()
            }
        }
    }
    
    func forgotButtonTapped() {
        
        Task {
            do {
                try await authServices.forgotPassword(email: email)
            } catch {
                print(error.localizedDescription)
                errorDescription = error.localizedDescription
                showLoginAlert.toggle()
            }
        }
    }
}

#Preview {
    LoginView()
}
