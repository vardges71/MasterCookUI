//
//  AddIngredientBtnView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-11-11.
//

import SwiftUI

struct AddIngredientBtnView: View {
    
//    MARK: - PROPERTIES
    
    @ObservedObject var searchVM: SearchViewModel
    @State private var showAlert = false
    
//    MARK: - BODY
    
    var body: some View {
        Button {
            
            ifIngredientTextFieldIsEmpty()
            hideKeyboard()
            print("Ingredient Array count: \(searchVM.ingredientArray.count)")
            
        } label: {
            Image(systemName: "plus")
                .frame(width: 44, height: 44, alignment: .center)
                .background(Colors.alertBackgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0).stroke(Colors.textColor, lineWidth: 2)
                )
                .offset(y: -7)
        }
        .alert(isPresented: self.$showAlert) { Alert(title: Text(" "), message: Text("Please enter ingredient or cuisine"), dismissButton: .default(Text("OK"))) }
    }
    
    func ifIngredientTextFieldIsEmpty(){
        
        if searchVM.ingredient.item.isEmpty {
            self.showAlert = true
        } else {

            searchVM.addIngredientToArray()
        }
    }
}

//  MARK: - PREVIEW

struct AddIngredientBtnView_Previews: PreviewProvider {
    static var previews: some View {
        AddIngredientBtnView(searchVM: SearchViewModel())
    }
}
