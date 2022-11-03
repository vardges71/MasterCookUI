//
//  RegisterButtonView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-24.
//

import SwiftUI

struct RegisterButtonView: View {
    
    @State private var showRegView = false
    
    var body: some View {
        Button("register") {
            
            self.showRegView.toggle()
        }
        .foregroundColor(Colors.textColor)
        .fullScreenCover(isPresented: $showRegView) { RegisterView() }
    }
}

struct RegisterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterButtonView()
    }
}
