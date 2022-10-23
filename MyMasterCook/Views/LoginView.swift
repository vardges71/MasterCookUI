//
//  LoginView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-20.
//

import SwiftUI

struct LoginView: View {
    
    @State var showMainView = false
    @State var showRegView = false
    var backImageName = "backYellow"
    @State var loginText = ""
    @State var passwordText = ""
    
    var body: some View {
        
        ZStack {
            fullBackground(imageName: backImageName)
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 6).fill(Color.clear)
                    Image("LogoYellow_New")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 210)
                }
                
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
                        self.showMainView.toggle()
                    }
                    .modifier(ActionButtonModifier())
                    .overlay(
                        RoundedRectangle(cornerRadius: 5.0).stroke(.white, lineWidth: 2)
                    )
                    .fullScreenCover(isPresented: $showMainView) { ContentView() }
                    .background(Colors.darkGrey)
                    .foregroundColor(Color.white)
                    
                    Spacer()
                    HStack {
                        Button("register") {
                            
                            self.showRegView.toggle()
                        } .foregroundColor(Colors.textColor)
                            .fullScreenCover(isPresented: $showRegView) { RegisterView() }
                        
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

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
