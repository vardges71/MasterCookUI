//
//  SettingLogOutButton.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-22.
//

import SwiftUI
import FirebaseAuth

struct SettingLogOutButton: View {
    
    @State private var showLoginView = false
    @State private var showingAlert = false
    
    var body: some View {
        
        Button() {
            
            self.showingAlert.toggle()
            
        } label: {
            
            HStack {
                Image(systemName: "arrow.backward.square")
                Text("sign out")
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
        
        .alert("Do you really want to sign out?", isPresented: $showingAlert) {
            
            Button("Sign out", role: .destructive, action: {
                
                self.showLoginView.toggle()
                Utilities.logOut()
            })
            
            Button("Cancel", role: .cancel, action: {})
        }
        .fullScreenCover(isPresented: $showLoginView) { LoginView() }
    }
}

struct SettingLogOutButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingLogOutButton()
    }
}
