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
                
                HStack {
                    Image(systemName: "exclamationmark.square")
                    Text("privacypolicy")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 5.0).stroke(Colors.textColor, lineWidth: 2)
                }
                .background(Colors.alertBackgroundColor)
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
