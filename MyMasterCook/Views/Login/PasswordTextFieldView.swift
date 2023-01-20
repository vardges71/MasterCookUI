//
//  PasswordTextFieldView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-11-28.
//

import SwiftUI

struct PasswordTextFieldView: View {
    
//    MARK: - PROPERTIES
    
    @ObservedObject var user = User()
    
//    MARK: - BODY
    
    var body: some View {
        VStack {
            SecureField("password:", text: $user.password)
                .modifier(TextFieldModifier())
                .keyboardType(.default)
                .textContentType(.password)
                .textInputAutocapitalization(.never)
            Divider()
        }
    }
}

//  MARK: - PREVIEW
struct PasswordTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextFieldView()
    }
}
