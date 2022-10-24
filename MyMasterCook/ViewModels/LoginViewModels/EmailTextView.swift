//
//  EmailTextView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-24.
//

import SwiftUI

struct EmailTextView: View {
    
    @State var loginText = ""
    
    var body: some View {
        VStack {
            TextField("e-mail:", text: $loginText)
                .modifier(TextFieldModifier())
                .keyboardType(.emailAddress)
                .preferredColorScheme(.light)
            
            Divider()
        }
    }
}

struct EmailTextView_Previews: PreviewProvider {
    static var previews: some View {
        EmailTextView()
    }
}
