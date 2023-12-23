//
//  AboutButtonView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-19.
//

import SwiftUI

struct AboutButtonView: View {
    
    @State private var showAboutView = false
    @State private var aboutView = AboutView()
    
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
                    RoundedRectangle(cornerRadius: 5.0).stroke(Color.accentColor, lineWidth: 2)
                }
                .background(Color.yellowButton)
            }
        }
        .foregroundStyle(Color.accentColor)
    }
}

#Preview {
    AboutButtonView()
}
