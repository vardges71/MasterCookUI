//
//  SettingDeleteAccountButton.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-22.
//

import SwiftUI

struct SettingDeleteAccountButton: View {
    
    @State private var showRegisterView = false
    @State private var showingAlert = false
    
    var body: some View {
        Button() {
            
            self.showingAlert.toggle()
        } label: {
            Label("delete account", systemImage: "trash.square")
        }
        .foregroundColor(Colors.textColor)
        .actionSheet(isPresented: $showingAlert) {
            ActionSheet(
                title: Text("Do you really want to delete your account?"),
                buttons: [
            
                    .destructive(Text("Delete")) {
                        
                        Utilities.deleteAccount()
                        self.showRegisterView.toggle()
                    },
                    .cancel(Text("Cancel")) {}
                ]
            )
        }
//        .alert("Do you really want to delete your account?", isPresented: $showingAlert) {
//
//            Button("Delete", role: .destructive, action: {
//
//                self.showRegisterView.toggle()
//                Utilities.deleteAccount()
//
//            })
//
//            Button("Cancel", role: .cancel, action: {})
//        }
        .fullScreenCover(isPresented: $showRegisterView) { ContentView() }
    }
}

struct SettingDeleteAccountButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingDeleteAccountButton()
    }
}
