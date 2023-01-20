//
//  RegisterEmailTextFielsView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-11-28.
//

import SwiftUI

struct RegisterEmailTextFielsView: View {
//    MARK: - PROPERTIES
    
//    @ObservedObject var user: User
    @Binding var email: String
    
//    MARK: - BODY
    var body: some View {
        
        VStack {
            TextField("e-mail:", text: $email)
                .modifier(TextFieldModifier())
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .onChange(of: email) { _ in
                    email = email.trimmingCharacters(in: .whitespacesAndNewlines)
//                    print("User email: \(registerVM.email)")
                }
            Divider()
        }
    }
}

//  MARK: - PREVIEW

//struct RegisterEmailTextFielsView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        RegisterEmailTextFielsView()
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
