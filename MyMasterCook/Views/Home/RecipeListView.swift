//
//  RecipeListView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-31.
//

import SwiftUI

struct RecipeListView: View {
    
    @StateObject var recipeListVM = RecipeListViewModel()
    
    var body: some View {
        
        VStack {
    
            List(recipeListVM.recipeArray, id: \.id) { index in
                
                NavigationLink(destination: SingleRecipeView(recipe: index)) {
                    
                    RecipeCellView(recipe: index)
                }
                .animation(.default, value: true)
                .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                .listRowBackground(Color.clear)
                
            } .scrollContentBackground(.hidden)
                .onAppear(perform: recipeListVM.load)//: LIST
        } //: VStack
    }
    
}

//struct RecipeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        let recipe = Recipe(id: "", name: "Vako", thumbnail_url: "", video_url: "", instructions: "")
//        return RecipeListView(response: [recipe]())
//    }
//}
