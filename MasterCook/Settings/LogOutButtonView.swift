//
//  LogOutButtonView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-18.
//

import SwiftUI

struct LogOutButtonView: View {
    
    @EnvironmentObject private var authServices: AuthServices
    
    @State private var showLoginView = false
    @State private var showAlert = false
    
    var body: some View {
        
        Button() {
            
            self.showAlert.toggle()
            
        } label: {
            
            HStack {
                Image(systemName: "arrow.backward.square")
                Text("sign out")
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 5.0).stroke(Color.accentColor, lineWidth: 2)
            }
            .background(Color.yellowButton)
            
        }
        .foregroundStyle(Color.accentColor)
        .alert("Do you really want to sign out?", isPresented: $showAlert) {
            
            Button("Sign out", role: .destructive, action: {
                
                self.showLoginView.toggle()
                logout()
            })
            
            Button("Cancel", role: .cancel, action: {})
        }
        .fullScreenCover(isPresented: $showLoginView) { MainView() }
    }
    
    func logout() {
        do {
            try authServices.logout()
        } catch {
            print(error.localizedDescription)
        }
    }
}


#Preview {
    LogOutButtonView()
}
