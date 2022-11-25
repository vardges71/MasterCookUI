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
        
        Button {
            self.showMainView.toggle()
            
        } label: {
            Text("continue as guest")
                .modifier(ActionButtonModifier())
                .background(Colors.darkGrey)
        }
        .fullScreenCover(isPresented: $showMainView) {
            if Auth.auth().currentUser != nil {
                MainTabView()
            } else {
                SecondaryTabView()
            }
        }
    }
}

//struct GuestButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        GuestButtonView(isLoading: isLoading)
//    }
//}
