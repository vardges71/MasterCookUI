//
//  RePasswordTextFieldView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-14.
//

import SwiftUI

struct RePasswordTextFieldView: View {
    
    @Binding var re_password: String
    
    var body: some View {
        VStack {
            SecureField("", text: $re_password, prompt: Text("confirm password:").foregroundStyle(Color("phTextColor")))
                .modifier(TextFieldModifier())
                .keyboardType(.default)
                .textContentType(.password)
                .textInputAutocapitalization(.never)
            Divider()
        }
    }
}

//#Preview {
//    RePasswordTextFieldView()
//}
