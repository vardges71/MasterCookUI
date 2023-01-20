//
//  RecipeListViewModel.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2023-01-09.
//

import Foundation

protocol UploadRecipesDelegate: AnyObject {
    
    func uploadRecipes(_ recipes: [Recipe])
}

class RecipeListViewModel: ObservableObject {
    
    @Published var recipeArray: [Recipe] = []
    @Published var recipeArrayEmpty = false
    @Published var isSearchBtnTapped = false
    
    func load() {

        WebService().parseJSON(recipeListVM: self)
    }
}

extension RecipeListViewModel: UploadRecipesDelegate {
    
    func uploadRecipes(_ recipes: [Recipe]) {
        
        self.recipeArray = recipes
        if recipeArray.isEmpty {
            recipeArrayEmpty.toggle()
        }
    }
}
