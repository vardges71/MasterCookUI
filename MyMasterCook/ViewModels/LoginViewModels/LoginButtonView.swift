//
//  LoginButtonView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-24.
//

import SwiftUI

struct LoginButtonView: View {
    var body: some View {
        
        Button("sign in") {
            
        }
        .modifier(ActionButtonModifier())
        .overlay(
            RoundedRectangle(cornerRadius: 5.0).stroke(.white, lineWidth: 2)
        )
        .background(Colors.buttonBackgroundColor)
        .foregroundColor(Color.white)
    }
}

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView()
    }
}
