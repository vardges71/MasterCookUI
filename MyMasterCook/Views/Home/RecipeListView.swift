//
//  RecipeListView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-31.
//

import SwiftUI

struct RecipeListView: View {
    
    //    MARK: - PROPERTIES
    
    @State private var isRecipeDataEmpty = false
    @State private var selection: Recipe? = nil
    @State private var shouldAnimate = false
    
    @StateObject var recipeListVM = RecipeListViewModel()
    
    //    MARK: - BODY
    
    var body: some View {
        
        VStack {
            
            if isRecipeDataEmpty {
                
                ZStack {

                    ActivityIndicator(shouldAnimate: $shouldAnimate)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                        .background( Color.black.opacity(0.7) )
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                checkRecipeDataEmpty()
                            }
                        }
                    Text("Loading...")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .tint(.white)
                        .padding(.top, 50)
                }
            } else {
                
                List(recipeData, id: \.id) { recipe in
                    
                    RecipeCellView(recipe: recipe)
                        .onTapGesture { selection = recipe }
                        .animation(.default, value: true)
                        .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                        .listRowBackground(Color.clear)
                    
                } //: LIST
                .onAppear { recipeListVM.load() }
                .scrollContentBackground(.hidden)
                .sheet(item: $selection,
                       onDismiss: { selection = nil }) { recipe in
                    SingleRecipeView(recipe: recipe)
                }
            }
        } //: VStack
        .onAppear { checkRecipeDataEmpty() }
    }
    
    func checkRecipeDataEmpty() {
        
        if recipeData.isEmpty {
            
            isRecipeDataEmpty = true
            shouldAnimate = true
            
        } else {
            isRecipeDataEmpty = false
            shouldAnimate = false
        }
    }
}

//MARK: - PREVIEW

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        //        let recipes: [Recipe] = [Recipe]()
        return RecipeListView()
    }
}
