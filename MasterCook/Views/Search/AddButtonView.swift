//
//  AddButtonView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-19.
//

import SwiftUI

struct AddButtonView: View {
    
    @EnvironmentObject private var webServices: WebServices
    @EnvironmentObject private var recipe: Recipe
    @State private var showAlert = false
    
    var body: some View {
        
        Button {
            
            ifIngredientTextFieldIsEmpty()
            print("Ingredient Array count: \(webServices.ingredients.count)")
            
        } label: {
            Image(systemName: "plus")
                .frame(width: 44, height: 44, alignment: .center)
                .background(Color.yellowButton)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0).stroke(Color.accentColor, lineWidth: 2)
                )
                .offset(y: -7)
        }
        .alert(isPresented: self.$showAlert) { Alert(title: Text(" "), message: Text("Please enter ingredient or cuisine"), dismissButton: .default(Text("OK"))) }
    }
    
    func ifIngredientTextFieldIsEmpty(){
        
        if recipe.ingredient.isEmpty {
            
            self.showAlert = true
        } else {

            webServices.ingredients.append(recipe.ingredient)
            recipe.ingredient = ""
        }
    }
}

#Preview {
    AddButtonView()
}
