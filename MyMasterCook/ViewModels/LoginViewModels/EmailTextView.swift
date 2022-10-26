//
//  EmailTextView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-24.
//

import SwiftUI

struct EmailTextView: View {
    
    @State var user: User
    
    var body: some View {
        
        VStack {
            TextField("e-mail:", text: $user.email)
                .modifier(TextFieldModifier())
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .preferredColorScheme(.light)
            
            Divider()
        }
    }
}

//struct EmailTextView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmailTextView()
//    }
//}
