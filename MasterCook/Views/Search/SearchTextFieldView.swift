//
//  SearchTextFieldView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-19.
//

import SwiftUI

struct SearchTextFieldView: View {
    
    @EnvironmentObject private var webServices: WebServices
    @EnvironmentObject private var recipe: Recipe
    
    var body: some View {
        VStack {
            TextField("", text: $recipe.ingredient, prompt: Text("ingredient:").foregroundStyle(Color("phTextColor")))
                .modifier(TextFieldModifier())
                .textInputAutocapitalization(.never)
                
            Divider()
        }
    }
}

//#Preview {
//    SearchTextFieldView()
//}
