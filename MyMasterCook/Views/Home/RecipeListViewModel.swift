//
//  RecipeListViewModel.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2023-01-09.
//

import Foundation

class RecipeListViewModel: ObservableObject {
    
    @Published var recipeArray: [Recipe] = []
    @Published var recipeEmpty = false
    
    func load() {

        if recipeData.isEmpty {

            parseJSON()
        }
    }
}

