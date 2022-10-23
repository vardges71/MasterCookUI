//
//  SettingPrivacyButton.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-22.
//

import SwiftUI

struct SettingPrivacyButton: View {
    var body: some View {
        Button() {
            
        } label: {
            Label("privacypolicy", systemImage: "exclamationmark.square")
        }
        .foregroundColor(Colors.textColor)
    }
}

struct SettingPrivacyButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingPrivacyButton()
    }
}
