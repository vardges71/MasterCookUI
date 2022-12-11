//
//  RegisterPasswordTextFieldView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-11-28.
//

import SwiftUI

struct RegisterPasswordTextFieldView: View {
//    MARK: - PROPERTIES
    
    @Binding var password: String
    
//    MARK: - BODY
    var body: some View {
        VStack {
            SecureField("password:", text: $password)
                .modifier(TextFieldModifier())
                .keyboardType(.default)
                .textContentType(.password)
                .textInputAutocapitalization(.never)
                .onChange(of: password) { _ in
                    password = password.trimmingCharacters(in: .whitespacesAndNewlines)
                }
            Divider()
        }
    }
}

//  MARK: - PREVIEW

//struct RegisterPasswordTextFieldView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterPasswordTextFieldView()
//    }
//}
