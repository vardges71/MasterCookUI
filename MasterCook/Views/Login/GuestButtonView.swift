//
//  GuestButtonView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-14.
//

import SwiftUI

struct GuestButtonView: View {
    
    let label: String
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Text(label)
                .modifier(ActionButtonModifier())
                .background(Color.grey)
        }
    }
}

//#Preview {
//    GuestButtonView()
//}
