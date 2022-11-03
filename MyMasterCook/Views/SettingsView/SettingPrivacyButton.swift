//
//  SettingPrivacyButton.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-22.
//

import SwiftUI

struct SettingPrivacyButton: View {
    
    @State private var showPrivacyView = false
    @State private var privacyView = PrivacyView()
    
    var body: some View {
        
        Button() {
            
        } label: {
            NavigationLink(destination:	privacyView) {
                Label("privacypolicy", systemImage: "exclamationmark.square")
            }
        }
        .foregroundColor(Colors.textColor)
    }
}

struct SettingPrivacyButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingPrivacyButton()
    }
}
