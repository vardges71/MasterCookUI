//
//  SettingsAboutButton.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-22.
//

import SwiftUI

struct SettingsAboutButton: View {
    
    @State private var showAboutView = false
    @State private var aboutView = AboutView()
    
    var title = "About"
    
    var body: some View {
        
        Button {
            
            self.showAboutView.toggle()
        } label: {
            NavigationLink(destination: aboutView) {
                Label("about", systemImage: "questionmark.square")
            }
        }
        .foregroundColor(Colors.textColor)
    }
}

struct SettingsAboutButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsAboutButton()
    }
}
