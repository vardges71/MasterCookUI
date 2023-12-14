//
//  SettingsView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-21.
//

import SwiftUI
import FirebaseAuth

struct SettingsView: View {
    
    var backImageName = "backYellow"
    let title = "Settings"
    @Binding var tabSelection: Int
    
    var bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                fullBackground(imageName: backImageName)
                VStack(spacing: 20) {
                    HStack {
                        VStack(alignment: .leading, spacing: 20) {
                            
                            SettingsAboutButton()
                            
                            SettingPrivacyButton()

                            ZStack {
                                
                                if Auth.auth().currentUser == nil {
                                    HStack {
                                        SettingLoginButton()
                                        
                                    }
                                } else {
                                    HStack {
                                        SettingLogOutButton()
                                        
                                    }
                                }
                            } .padding(.top, 10)
                            
                            HStack {

                                if Auth.auth().currentUser == nil {
                                    SettingDeleteAccountButton()
                                        .opacity(0.5)
                                        .disabled(true)
                                } else {
                                    SettingDeleteAccountButton()
                                }
                            } .padding(.top, 10)
                            
                            Spacer()
                        }
                        Spacer()
                    } .padding(20)
                }
            }
            .navigationTitle(title)
            .navigationBarTitleTextColor(Colors.textColor)
        }
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        SettingsView(tabSelection: 1)
//    }
//}
