//
//  RegisterButtonView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-24.
//

import SwiftUI

struct GoToRegisterButtonView: View {
//    MARK: - PROPERTIES
    
    @State private var showRegView = false
    
    
//    MARK: - BODY
    var body: some View {
        Button("register") {
            
            self.showRegView.toggle()
        }
        .foregroundColor(Colors.textColor)
        .fullScreenCover(isPresented: $showRegView) { RegisterView() }
    }
}

//  MARK: - PREVIEW

//struct GoToRegisterButtonView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        GoToRegisterButtonView()
//    }
//}
