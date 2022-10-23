//
//  SettingLogOutButton.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-22.
//

import SwiftUI

struct SettingLogOutButton: View {
    
    @State private var showLoginView = false
    
    var body: some View {
        
        Button() {
            
            self.showLoginView.toggle()
        } label: {
            Label("logout", systemImage: "arrow.backward.square")
        }
        .foregroundColor(Colors.textColor)
        .fullScreenCover(isPresented: $showLoginView) { LoginView() }
    }
}

struct SettingLogOutButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingLogOutButton()
    }
}
