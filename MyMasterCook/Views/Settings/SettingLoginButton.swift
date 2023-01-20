//
//  SettingLoginButton.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-22.
//

import SwiftUI

struct SettingLoginButton: View {
    
    @State private var showLoginView = false
    
    var body: some View {
        
        Button() {
            
            self.showLoginView.toggle()
        } label: {
            Label("login", systemImage: "arrow.forward.square")
        }
        .foregroundColor(Colors.textColor)
        .fullScreenCover(isPresented: $showLoginView) { LoginView() }
    }
}

struct SettingLoginButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingLoginButton()
    }
}
