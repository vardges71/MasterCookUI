//
//  LoginView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-20.
//

//import Foundation
import SwiftUI
import FirebaseAuth
//import UIKit

struct LoginView: View {
    
    @ObservedObject var user = User()
    
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
                    LoginButtonView(user: user)
                    GuestButtonView()
                    Spacer()
                    HStack {
                        RegisterButtonView()
                        Spacer()
                        ForgotPasswordButtonView(user: user)
                    }
                }.padding(40)
            }
            .preferredColorScheme(.light)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
