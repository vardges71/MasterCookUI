//
//  LoginView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-20.
//

import SwiftUI

struct LoginView: View {
    
    var backImageName = "backYellow"
    
    var body: some View {
        
        ZStack {
            fullBackground(imageName: backImageName)
            VStack {
                LogoView()
                VStack(spacing: 17) {
                    EmailTextView()
                    PasswordTextView()
                    Spacer()
                    LoginButtonView()
                    GuestButtonView()
                    Spacer()
                    HStack {
                        RegisterButtonView()
                        Spacer()
                        ForgotPasswordButtonView()
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
