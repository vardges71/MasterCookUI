//
//  LoginView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-20.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
//    MARK: - PROPERTIES
    
    @ObservedObject var user = User()
    var backImageName = "backYellow"
    
//    MARK: - BODY
    var body: some View {
        
        ZStack {
            fullBackground(imageName: backImageName)
            VStack {
                LogoView()
                VStack(spacing: 20) {
                    EmailTextFieldView(user: user)
                    PasswordTextFieldView(user: user)
                    Spacer()
                    LoginButtonView(user: user)
                    GuestButtonView()
                    Spacer()
                    HStack {
                        GoToRegisterButtonView()
                        Spacer()
                        ForgotPasswordButtonView(user: user)
                    }
                }.padding(40)
            }
            .preferredColorScheme(.light)
        }
    }
}

//  MARK: - PREVIEW
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
