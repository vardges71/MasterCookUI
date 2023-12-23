//
//  ClearButtonView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-19.
//

import SwiftUI

struct ClearButtonView: View {
    
    @EnvironmentObject private var webServices: WebServices
    @EnvironmentObject private var recipe: Recipe
    
    var body: some View {
        
        Button {

            clearIngredients()
            print("Ingredient Array count: \(webServices.ingredients.count)")
            
        } label: {
            Label("clear", systemImage: "trash")
                .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
                .background(Color.yellowButton)
                .foregroundStyle(Color.accentColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0).stroke(Color.accentColor, lineWidth: 2)
                )
        }
    }
    
    func clearIngredients() {
        
        webServices.ingredients.removeAll()
        recipe.ingredient = ""
    }
}

#Preview {
    ClearButtonView()
}
