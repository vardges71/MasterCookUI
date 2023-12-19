//
//  SettingLoginButtonView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-19.
//

import SwiftUI

struct SettingLoginButtonView: View {
    
    @State private var showLoginView = false
    
    var body: some View {
        
        Button() {
            
            self.showLoginView.toggle()
        } label: {
            
            HStack {
                Image(systemName: "arrow.forward.square")
                Text("login")
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 5.0).stroke(Color.accentColor, lineWidth: 2)
            }
            .background(Color.yellowButton)
        }
        .foregroundColor(Color.accentColor)
        .fullScreenCover(isPresented: $showLoginView) { MainView() }
    }
}

#Preview {
    SettingLoginButtonView()
}
