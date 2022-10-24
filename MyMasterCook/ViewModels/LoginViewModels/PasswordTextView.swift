//
//  PasswordTextView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-24.
//

import SwiftUI

struct PasswordTextView: View {
    
    @State var passwordText = ""
    
    var body: some View {
        VStack {
            SecureField("password:", text: $passwordText)
                .modifier(TextFieldModifier())
                .keyboardType(.default)
                .preferredColorScheme(.light)
            Divider()
        }
    }
}

struct PasswordTextView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextView()
    }
}
