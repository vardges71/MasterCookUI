//
//  SearchTextFieldView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-11-11.
//

import SwiftUI

struct SearchTextFieldView: View {
    
    @ObservedObject var searchVM: SearchViewModel
    
    var body: some View {
        
        VStack {
            TextField("ingredient:", text: $searchVM.ingredient.item)
                .modifier(TextFieldModifier())
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .onChange(of: searchVM.ingredient.item) { newValue in
                    searchVM.ingredient.item = newValue.trimmingCharacters(in: .whitespacesAndNewlines)
                    print("Changed ingredient value: \(searchVM.ingredient.item) \nINgredient Array: \(searchVM.ingredientArray)")
                }
            Divider()
        }
    }
}

struct SearchTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextFieldView(searchVM: SearchViewModel())
    }
}
