//
//  GuestButtonView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-24.
//

import SwiftUI
import FirebaseAuth

struct GuestButtonView: View {
    
    @State private var showMainView = false
    
    var body: some View {
        Button("continue as guest") {
            
            self.showMainView.toggle()
        }
        .modifier(ActionButtonModifier())
        .fullScreenCover(isPresented: $showMainView) {
            if Auth.auth().currentUser != nil {
                MainTabView()
            } else {
                SecondaryTabView()
            }
        }
        .background(Colors.darkGrey)
        .foregroundColor(Color.white)
    }
}

struct GuestButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GuestButtonView()
    }
}
