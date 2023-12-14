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
            
            HStack {
                Image(systemName: "arrow.forward.square")
                Text("login")
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 5.0).stroke(Colors.textColor, lineWidth: 2)
            }
            .background(Colors.alertBackgroundColor)
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
