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
    
    @State private var showingAlert = false
    @State private var errorDescription: String = ""
    
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
                    LoginButtonView(label: "login") {
                        authenticate()
                    }
                    GuestButtonView(label: "continue as guest") {
                        print("Guest button tapped!!!")
                    }
                } .padding(40)
            }
            .alert(isPresented: self.$showingAlert) { Alert(title: Text("Error..."), message: Text("\(errorDescription)"), dismissButton: .default(Text("OK"))) }
        }
    }
    
    func authenticate() {
        
        Task {
            do {
                try await authServices.login(email: email, password: password)
            } catch {
                print(error.localizedDescription)
                errorDescription = error.localizedDescription
                showingAlert.toggle()
            }
        }
    }
}

#Preview {
    LoginView()
}
