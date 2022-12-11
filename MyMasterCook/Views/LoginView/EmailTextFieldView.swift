//
//  EmailTextFieldView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-11-28.
//

import SwiftUI

struct EmailTextFieldView: View {
    
    //    MARK: - PROPERTIES
    
    @ObservedObject var user = User()
    
    //    MARK: - BODY
    var body: some View {
        
        VStack {
            TextField("e-mail:", text: $user.email)
                .modifier(TextFieldModifier())
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .onChange(of: user.email) { _ in
                    user.email = user.email.trimmingCharacters(in: .whitespacesAndNewlines)
                }
            Divider()
        }
    }
}

//  MARK: - PREVIEW

struct EmailTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        EmailTextFieldView(user: User())
    }
}
