//
//  ForgotPasswordButtonView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-24.
//

import SwiftUI

struct ForgotPasswordButtonView: View {
    
    @State var recoveryPassword: Bool = false
    var body: some View {
        Button("forgot password?") {
            
            self.recoveryPassword.toggle()
        } .foregroundColor(Colors.textColor)
    }
}

struct ForgotPasswordButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordButtonView()
    }
}
