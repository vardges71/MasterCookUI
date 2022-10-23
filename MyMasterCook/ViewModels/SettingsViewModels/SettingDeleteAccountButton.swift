//
//  SettingDeleteAccountButton.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-22.
//

import SwiftUI

struct SettingDeleteAccountButton: View {
    
    @State private var showRegisterView = false
    
    var body: some View {
        Button() {
            
            self.showRegisterView.toggle()
        } label: {
            Label("delete account", systemImage: "trash.square")
        }
        .foregroundColor(Colors.textColor)
        .fullScreenCover(isPresented: $showRegisterView) { RegisterView() }
    }
}

struct SettingDeleteAccountButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingDeleteAccountButton()
    }
}
