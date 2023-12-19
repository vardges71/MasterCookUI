//
//  SettingsView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-18.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject private var authServices: AuthServices
    
    @Binding var tabSelection: Int
    let title = "Settings"
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                fullBackground(imageName: "backYellow")
                VStack(spacing: 20) {
                    AboutButtonView()
                    PrivacyPolicyButtonView()
                    if authServices.authState == .authorised {
                        LogOutButtonView()
                    } else {
                        SettingLoginButtonView()
                    }
                    if authServices.authState == .notAuthorised {
                        DeleteAccountButtonView()
                            .opacity(0.5)
                            .disabled(true)
                    } else {
                        DeleteAccountButtonView()
                    }
                    Spacer()
                }
                .padding()
            }
            .navigationTitle(title)
        }
    }
}

/*
 #Preview {
 SettingsView()
 }
 */
