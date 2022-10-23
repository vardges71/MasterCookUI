//
//  LoginView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-20.
//

import SwiftUI

struct LoginView: View {
    
    @State var backImageName = "backYellow"
    @State var loginText = ""
    @State var passwordText = ""
    
    var body: some View {
        
        ZStack {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 6).fill(Color.clear)
                    Image("LogoYellow_New")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 210)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 6).fill(Color.clear)
                    
                    VStack(spacing: 17) {
                        
                        TextField("e-mail:", text: $loginText)
                            .modifier(TextFieldModifier())
                            .keyboardType(.emailAddress)
                        
                        SecureField("password:", text: $passwordText)
                            .modifier(TextFieldModifier())
                            .keyboardType(.default)
                        
                        Spacer()
                        Button("sign in") {
                            
                        }
                        .modifier(ActionButtonModifier())
                        .overlay(
                            RoundedRectangle(cornerRadius: 5.0).stroke(.white, lineWidth: 2)
                        )
                        .background(Colors.buttonBackgroundColor)
                        .foregroundColor(Color.white)

                        Button("continue as guest") {
                            
                        }
                        .modifier(ActionButtonModifier())
                        .overlay(
                            RoundedRectangle(cornerRadius: 5.0).stroke(.white, lineWidth: 2)
                        )
                        .background(Colors.darkGrey)
                        .foregroundColor(Color.white)
                     
                        Spacer()
                        HStack {
                            Button("register") {
                                
                            }
                            .foregroundColor(Colors.textColor)
                            
                            Spacer()
                            
                            Button("forgot password?") {
                                
                            }
                            .foregroundColor(Colors.textColor)
                        }
                    } .padding(20)
                }
            }
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
