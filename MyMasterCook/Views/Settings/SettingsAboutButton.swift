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
    let scrollHeight = UIScreen.main.bounds.height * 0.45
    
    //    var title = "About"
    
    var body: some View {

        Button {
            
            self.showAboutView.toggle()
        } label: {
            NavigationLink(destination: aboutView) {
                
                HStack {
                    Image(systemName: "questionmark.square")
                    Text("about")
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

struct SettingsAboutButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsAboutButton()
    }
}
