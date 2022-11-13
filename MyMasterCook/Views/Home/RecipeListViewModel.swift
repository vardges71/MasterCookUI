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
    
    @Published var recipe: Recipe = Recipe()
    @Published var homeBadgeValue: Int = 0
    @Published var recipeArray: [Recipe] = [Recipe]()
    
    func load() {
        
        if recipeArray.isEmpty {
            
            WebService().parseJSON(recipeListVM: self)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                print("Badge Value: \(self.recipeArray.count)\n")
            }
        } else {

            print("Recipe array after start \(self.recipeArray.count)")
        }
    }
}

extension RecipeListViewModel: UploadRecipesDelegate {
    
    func uploadRecipes(_ recipes: [Recipe]) {
        
        recipeArray = recipes
        let rA = RecipeArray()
        rA.recAarray = recipes
        for recipe in recipeArray {
            print("Recipe Name is: \(recipe.name)")
        }
        
        print("Recipe list from RecipeListVM: \(recipeArray.count)\n")
    }
}
