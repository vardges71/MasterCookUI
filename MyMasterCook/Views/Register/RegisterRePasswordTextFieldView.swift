//
//  RegisterRePasswordTextFieldView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-11-28.
//

import SwiftUI

struct RegisterRePasswordTextFieldView: View {
    //    MARK: - PROPERTIES
    
    @Binding var re_password: String
    
    //    MARK: - BODY
    var body: some View {
        VStack {
            SecureField("confirm password:", text: $re_password)
                .modifier(TextFieldModifier())
                .keyboardType(.default)
                .textContentType(.password)
                .textInputAutocapitalization(.never)
                .onChange(of: re_password) { _ in
                    re_password = re_password.trimmingCharacters(in: .whitespacesAndNewlines)
                }
            Divider()
        }
    }
}

//  MARK: - PREVIEW

//struct RegisterRePasswordTextFieldView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterRePasswordTextFieldView()
//    }
//}
