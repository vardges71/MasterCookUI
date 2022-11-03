//
//  RecipeListViewModel.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-31.
//

import Foundation

protocol UploadRecipesDelegate: AnyObject {

    func uploadRecipes(_ recipes: [Recipe])
}

class RecipeListViewModel: ObservableObject {
    
    @Published var recipeArray: [Recipe] = [Recipe]()
    
    func load() {
        
        WebService().parseJSON(recipeListViewModel: self)
    }
}

extension RecipeListViewModel: UploadRecipesDelegate {
    
    func uploadRecipes(_ recipes: [Recipe]) {
        
        self.recipeArray = recipes
            
        for recipe in recipeArray {
            print("Recipe Name is: \(recipe.name)")
        }
        print("Recipe list: \(recipeArray.count)\n")
    }
}
