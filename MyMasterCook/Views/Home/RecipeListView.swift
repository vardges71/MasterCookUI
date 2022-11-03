//
//  RecipeListView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-31.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var recipeListVM: RecipeListViewModel
    
    var body: some View {
        
        VStack {
            
            List(recipeListVM.recipeArray, id: \.id) { recipe in
                
                NavigationLink(destination: SingleRecipeView(recipe: recipe)) {
                    
                    RecipeCellView(recipe: recipe)
                }
                .animation(.default, value: true)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                
            } .scrollContentBackground(.hidden)
                .onAppear{
                    recipeListVM.load()
                }
        }
    }
}


//struct RecipeCellView: View {
//
//    let recipe: Recipe
//
//    var body: some View {
//
//        ZStack {
//            VStack {
//
//                Text("\(recipe.name)") .foregroundColor(Colors.textColor)
//
//            }
//        }
//    }
//}


//struct RecipeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        let recipe = Recipe(id: "", name: "Vako", thumbnail_url: "", video_url: "", instructions: "")
//        return RecipeListView(response: [recipe]())
//    }
//}
