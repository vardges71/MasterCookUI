//
//  LoginView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-20.
//

import Foundation
import SwiftUI
import FirebaseAuth
import UIKit

struct LoginView: View {
    
    @ObservedObject var user = User()
    @State private var showingAlert = false
    @State private var showMainView = false

    @State private var errorDescription: String = ""
    
    var backImageName = "backYellow"
    
    var body: some View {
        
        ZStack {
            fullBackground(imageName: backImageName)
            VStack {
                LogoView()
                VStack(spacing: 17) {
                    VStack {
                        TextField("e-mail:", text: $user.email)
                            .modifier(TextFieldModifier())
                            .keyboardType(.emailAddress)
                            .textContentType(.emailAddress)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            .onChange(of: user.email) { _ in
                                user.email = user.email.trimmingCharacters(in: .whitespacesAndNewlines)
                            }
                        Divider()
                    }
                    VStack {
                        SecureField("password:", text: $user.password)
                            .modifier(TextFieldModifier())
                            .keyboardType(.default)
                            .textContentType(.password)
                            .textInputAutocapitalization(.never)
                        Divider()
                    }
                    Spacer()
                    Button {

                        checkUser()
                        hideKeyboard()
                    } label: {

                        Text("log on")
                            .modifier(ActionButtonModifier())
                            .background(Colors.buttonBackgroundColor)
                    }
                    .alert(isPresented: self.$showingAlert) { Alert(title: Text("Error..."), message: Text("\(errorDescription)"), dismissButton: .default(Text("OK"))) }
                    .fullScreenCover(isPresented: $showMainView) { MainTabView() }
                    .background(Colors.buttonBackgroundColor)
                    
                    GuestButtonView()
                    Spacer()
                    HStack {
                        RegisterButtonView()
                        Spacer()
                        ForgotPasswordButtonView()
                    }
                }.padding(40)
            }
            .preferredColorScheme(.light)
        }
    }
    func checkUser(){
        
        Auth.auth().signIn(withEmail: user.email, password: user.password) { (result, error) in
            
            if error != nil {
                
                self.showingAlert = true
                self.errorDescription = error!.localizedDescription
                
            } else {
                
                print("User logged in \($user.email)")
                showMainView.toggle()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
