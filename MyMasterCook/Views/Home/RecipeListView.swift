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
    
//    MARK: - BODY
    
    var body: some View {
        
        VStack {
            
            if isRecipeDataEmpty {
                
                ProgressView("Loading...")
                    .onAppear {  }
                    .progressViewStyle(.circular)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                    .tint(.white)
                    .padding()
                    .background( Color.black.opacity(0.7) )
                    .foregroundColor(.white)
                    
            } else {
                
                List(recipeData, id: \.id) { recipe in

                    ZStack(alignment: .leading) {

//                        NavigationLink(destination:
//                                        SingleRecipeView(recipe: recipe)) {
//                            EmptyView()
//                        } .opacity(0)


                        RecipeCellView(recipe: recipe)
                            .onTapGesture { selection = recipe }
                    }
                    .animation(.default, value: true)
                    .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                    .listRowBackground(Color.clear)

                } //: LIST
                .sheet(item: $selection,
                               onDismiss: { self.selection = nil }) { recipe in
                                    SingleRecipeView(recipe: recipe)
                               }
                .scrollContentBackground(.hidden)
            }
        } //: VStack
        .onAppear { checkRecipeDataEmpty() }
        
    }
    
    func checkRecipeDataEmpty() {
        if recipeData.isEmpty {
            isRecipeDataEmpty = true
            parseJSON()
            DispatchQueue.main.async {
                isRecipeDataEmpty = false
            }
            
        } else {
            isRecipeDataEmpty = false
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
