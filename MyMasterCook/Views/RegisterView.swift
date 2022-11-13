//
//  RegisterView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-20.
//

import SwiftUI

struct RegisterView: View {
    
    var backImageName = "backYellow"
    @State private var showLoginView = false
    var title = "Register"
    @State private var email = ""
    @State private var password = ""
    @State private var re_password = ""
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                fullBackground(imageName: backImageName)
                VStack(spacing: 20) {
                    Spacer()
                    TextField("e-mail:", text: $email)
                        .modifier(TextFieldModifier())
                        .keyboardType(.emailAddress)
                        .preferredColorScheme(.light)
                    Divider()
                    
                    SecureField("password:", text: $password)
                        .modifier(TextFieldModifier())
                        .keyboardType(.default)
                        .preferredColorScheme(.light)
                    Divider()
                    
                    SecureField("confirm password:", text: $re_password)
                        .modifier(TextFieldModifier())
                        .keyboardType(.default)
                        .preferredColorScheme(.light)
                    Divider()
                    
                    Spacer()
                    VStack(spacing: 20) {
                        Button("register") {
                            
                        }
//                        .modifier(ActionButtonModifier())
                        .overlay(
                            RoundedRectangle(cornerRadius: 5.0).stroke(.white, lineWidth: 2)
                        )
                        .background(Colors.buttonBackgroundColor)
                        .foregroundColor(Color.white)
                        
                        
                        Button("back to login") {
                            
                            self.showLoginView.toggle()
                        }
                        .fullScreenCover(isPresented: $showLoginView) { LoginView() }
                        .foregroundColor(Colors.textColor)
                    }
                    Spacer()
                }.padding(20)
                Spacer()
            }
            .navigationTitle(title)
            .navigationBarTitleTextColor(Colors.textColor)
        }
    }
}

//struct RegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView()
//    }
//}
