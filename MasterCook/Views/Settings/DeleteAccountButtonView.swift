//
//  DeleteAccountButtonView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-19.
//

import SwiftUI
import FirebaseDatabase

struct DeleteAccountButtonView: View {
    
    @EnvironmentObject private var authServices: AuthServices
    
    @State private var showLoginView = false
    @State private var showAlert = false
    
    var body: some View {
        
        Button() {
            
            self.showAlert.toggle()
            
        } label: {
            
            HStack {
                Image(systemName: "trash.square")
                Text("delete account")
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 5.0).stroke(Color.white, lineWidth: 2)
            }
            .background(Color.tabbarBadge)
            
        }
        .foregroundStyle(Color.white)
        
        .alert("Do you really want to delete your account?", isPresented: $showAlert) {
            
            Button("Delete", role: .destructive, action: {
                
                delete()
                DispatchQueue.main.async {
                    
                    self.showLoginView.toggle()
                }
                
            })
            
            Button("Cancel", role: .cancel, action: {})
        }
        .fullScreenCover(isPresented: $showLoginView) { MainView() }
    }
    
    func delete() {
        
        let userID = authServices.uid
        let db: DatabaseReference!
        
        db = Database.database().reference()
        db.child("users").child(userID).removeValue()
        
        authServices.deleteAccount()
    }
}

#Preview {
    DeleteAccountButtonView()
}
