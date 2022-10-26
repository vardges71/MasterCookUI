//
//  LoginButtonView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-24.
//

import SwiftUI
import FirebaseAuth

struct LoginButtonView: View {
    
//    @State var showingAlert = false
//    @State var showMainView = false
    
//    @State var email: User.user.email
//    @State var password = PasswordTextView().password
    
    var body: some View {
        
        Button("log on") {
            
//            print("Print email: \(user.email)")
            
//            Auth.auth().signIn(withEmail: self.email, password: self.password) { (result, error) in
//
//                if error != nil {
//                    self.showingAlert = true
//                    print("User logged in \(self.email)")
//                } else {
//                    self.$showMainView
//                    print("User logged in \(self.email)")
//                }
//            }
            
//            hideKeyboard()
//        }
//        .alert("Important message", isPresented: $showingAlert) {
//            Button("OK", role: .cancel) { }
        }
//        .fullScreenCover(isPresented: $showMainView) { ContentView() }
//        .modifier(ActionButtonModifier())
//        .overlay(
//            RoundedRectangle(cornerRadius: 5.0).stroke(.white, lineWidth: 2)
//        )
//        .background(Colors.buttonBackgroundColor)
//        .foregroundColor(Color.white)
    }
}

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView()
    }
}
