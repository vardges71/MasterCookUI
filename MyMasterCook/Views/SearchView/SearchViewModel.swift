//
//  SearchViewModel.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-11-11.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    
    @Published var ingredientArray: [String] = []
    @Published var ingredient: Ingredient = Ingredient()
    @Published var addIngredient = false
    @Published var clearIngredients = false
    @Published var showHomeView = false
    
    @Published private var showAlert = false
    
    func addIngredientToArray() {
        if ingredient.item.isEmpty {
            print("ingredient is empty")
        } else {
            ingredientArray.append(ingredient.item)
            ingredient.item = ""
        }
    }
    
    func clearIngredient() {
        ingredientArray.removeAll()
        ingredient.item = ""
    }
}


