//
//  RecipeListViewModel.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-31.
//

import SwiftUI

protocol UploadRecipesDelegate: AnyObject {
    
    func uploadRecipes(_ recipes: [Recipe])
}

class RecipeListViewModel: ObservableObject {
    
//    @Published var homeBadgeValue: Int?
//    @Published var recipeArray: [Recipe] = [Recipe]()
    
//    @Published var isLoading = true
    
//    func load() -> [Recipe] {
//
//        if recipeData.isEmpty {
//
//            parseJSON()
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//
//                print("Badge Value: \(recipeData.count)\n")
//            }
//        } else {
//
//            print("Recipe array after start \(recipeData.count)")
//        }
//
//        return recipeData
//    }
}

//extension RecipeListViewModel: UploadRecipesDelegate {
//
//    func uploadRecipes(_ recipes: [Recipe]) {
//
//        recipeArray = recipes
//        isLoading.toggle()
//        homeBadgeValue = recipes.count
//
//        print("Recipe list from RecipeListVM: \(recipeArray.count)\n")
//    }
//}
