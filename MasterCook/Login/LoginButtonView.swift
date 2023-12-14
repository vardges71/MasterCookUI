//
//  LoginButtonView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-14.
//

import SwiftUI

struct LoginButtonView: View {
    
    let label: String
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Text(label)
                .modifier(ActionButtonModifier())
                .background(Color.buttonBackground)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0).stroke(.white, lineWidth: 2)
                )
        }
    }
}

//#Preview {
//    LoginButtonView()
//}
