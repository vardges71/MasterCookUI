//
//  SettingsView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-21.
//

import SwiftUI

struct SettingsView: View {
    
    var backImageName = "backYellow"
    let title = "Settings"
    @State var isUserExist = false
    @Binding var tabSelection: Int
    @State public var selection = 1
    
    var body: some View {
        
        NavigationView {
            ZStack {
                fullBackground(imageName: backImageName)
                VStack(spacing: 20) {
                    HStack {
                        VStack {

                            HStack {
                                
                                SettingsAboutButton()
                                Spacer()
                            }
                            HStack {
                                
                                SettingPrivacyButton()
                                Spacer()
                            } .padding(.top, 10)
                            ZStack {

                                if self.isUserExist {
                                    HStack {
                                        SettingLogOutButton()
                                        Spacer()
                                    }
                                } else {
                                    HStack {
                                        SettingLoginButton()
                                        Spacer()
                                    }
                                }
                            } .padding(.top, 10)
                            
                            HStack {

                                if isUserExist {
                                    SettingDeleteAccountButton()
                                } else {
                                    SettingDeleteAccountButton().opacity(0.5)
                                        .disabled(true)
                                }
                                
                                Spacer()
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
