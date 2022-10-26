//
//  LoginView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-20.
//

import SwiftUI
import FirebaseAuth
import UIKit

struct LoginView: View {
    
    @ObservedObject var user = User()
    @State var showingAlert = false
    @State var showMainView = false

    @State var errorDescription: String = ""
    
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
                            .preferredColorScheme(.light)
                        
                        Divider()
                    }
                    VStack {
                        SecureField("password:", text: $user.password)
                            .modifier(TextFieldModifier())
                            .keyboardType(.default)
                            .textContentType(.password)
                            .textInputAutocapitalization(.never)
                            .preferredColorScheme(.light)
                        Divider()
                    }
                    Spacer()
                    Button("log on") {
                        
                        Auth.auth().signIn(withEmail: user.email, password: user.password) { (result, error) in

                            if error != nil {

                                self.showingAlert = true
                                self.errorDescription = error!.localizedDescription

                            } else {

                                print("User logged in \($user.email)")
                                showMainView.toggle()
                            }
                        }
                        
                        hideKeyboard()
                    }
                    .fullScreenCover(isPresented: $showMainView) { MainTabView() }
                    .alert(isPresented: self.$showingAlert) { Alert(title: Text("Error..."), message: Text("\(errorDescription)"), dismissButton: .default(Text("OK"))) }
                    
                    .fullScreenCover(isPresented: $showMainView) { ContentView() }
                    .modifier(ActionButtonModifier())
                    .overlay(
                        RoundedRectangle(cornerRadius: 5.0).stroke(.white, lineWidth: 2)
                    )
                    .background(Colors.buttonBackgroundColor)
                    .foregroundColor(Color.white)
                    
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
    func checkUser(){
        
        Auth.auth().signIn(withEmail: user.email, password: user.password) { (result, error) in
            
            if error != nil {
                
                self.showingAlert = true
                
                
        
            } else {
                
                print("User logged in \($user.email)")
        
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
