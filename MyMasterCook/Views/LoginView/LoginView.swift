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
                            .preferredColorScheme(.light)
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
