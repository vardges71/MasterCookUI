//
//  PasswordTextView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-24.
//

import SwiftUI

struct PasswordTextView: View {
    
    @State var password: String = ""
    
    var body: some View {
        VStack {
            SecureField("password:", text: $password)
                .modifier(TextFieldModifier())
                .keyboardType(.default)
                .textContentType(.password)
                .textInputAutocapitalization(.never)
                .preferredColorScheme(.light)
            Divider()
        }
    }
}

//struct PasswordTextView_Previews: PreviewProvider {
//    static var previews: some View {
//        PasswordTextView()
//    }
//}
