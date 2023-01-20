//
//  RegisterView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-20.
//

import SwiftUI

struct RegisterView: View {
    
//    MARK: - PROPERTIES
    
    var backImageName = "backYellow"
    @State private var showLoginView = false
    var title = "Register"
    
    @State var email: String = ""
    @State var password: String = ""
    @State var re_password: String = ""
    
//    MARK: - BODY
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                fullBackground(imageName: backImageName)
                VStack(spacing: 20) {
                    
                    Spacer()
                    RegisterEmailTextFielsView(email: $email)
                    RegisterPasswordTextFieldView(password: $password)
                    RegisterRePasswordTextFieldView(re_password: $re_password)
                    Spacer()
                    VStack(spacing: 20) {
                        
                        RegisterButtonView(email: $email, password: $password, re_password: $re_password)
                        
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

//  MARK: - PREVIEW

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
