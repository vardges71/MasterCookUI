//
//  GuestButtonView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-24.
//

import SwiftUI

struct GuestButtonView: View {
    
    @State var showMainView = false
    
    var body: some View {
        Button("continue as guest") {
            self.showMainView.toggle()
        }
        .modifier(ActionButtonModifier())
        .overlay(
            RoundedRectangle(cornerRadius: 5.0).stroke(.white, lineWidth: 2)
        )
        .fullScreenCover(isPresented: $showMainView) { ContentView() }
        .background(Colors.darkGrey)
        .foregroundColor(Color.white)
    }
}

struct GuestButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GuestButtonView()
    }
}
