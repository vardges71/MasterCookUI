//
//  LoginButtonView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-11-10.
//

import SwiftUI
import FirebaseAuth

struct LoginButtonView: View {
    
    @ObservedObject var user = User()
    @State private var showingAlert = false
    @State private var showMainView = false
    @State private var errorDescription: String = ""
    
    var body: some View {
        Button {
            
            checkUser()
            hideKeyboard()
            
        } label: {
            Text("log on")
                .frame(width: UIScreen.main.bounds.width - 20, height: 44, alignment: .center)
                .background(Colors.buttonBackgroundColor)
                .foregroundColor(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0).stroke(.white, lineWidth: 2)
                )
        }
        .fullScreenCover(isPresented: $showMainView) { MainTabView() }
        .alert(isPresented: self.$showingAlert) { Alert(title: Text("Error..."), message: Text("\(errorDescription)"), dismissButton: .default(Text("OK"))) }
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

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView()
    }
}
