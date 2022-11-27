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
        
        if recipeData.isEmpty {
            
            ProgressView("Loading...")
                .onAppear { parseJSON() }
                .progressViewStyle(.circular)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                .tint(.white)
                .padding()
                .background(Color(white: 0.2, opacity: 0.7))
                .foregroundColor(.white)
            
        } else {
            VStack {
                List(recipeData, id: \.id) { index in
                    
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: SingleRecipeView(recipe: index)) {
                            EmptyView()
                        } .opacity(0)
                        
                        RecipeCellView(recipe: index)
                    }
                    .animation(.default, value: true)
                    .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                    .listRowBackground(Color.clear)
                } //: LIST
                .scrollContentBackground(.hidden)
                    
            } //: VStack
        }
    }
}

//struct RecipeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        let recipe = Recipe(id: "", name: "Vako", thumbnail_url: "", video_url: "", instructions: "")
//        return RecipeListView(response: [recipe]())
//    }
//}
