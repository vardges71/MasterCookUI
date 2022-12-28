//
//  FavoritesListView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-12-26.
//

import SwiftUI

struct FavoritesListView: View {
    
    //    MARK: - PROPERTIES
    
    @State private var selection: Recipe? = nil
    
    //    MARK: - BODY
    var body: some View {
        
        VStack {
            
            if favoriteRecipeData.isEmpty {
                ProgressView("Loading...")
                    .progressViewStyle(.circular)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                    .tint(.white)
                    .padding()
                    .background( Color.black.opacity(0.7) )
                    .foregroundColor(.white)
            } else {
                List(favoriteRecipeData, id: \.id) { favorite in
                    
                    ZStack(alignment: .leading) {
                        
                        RecipeCellView(recipe: favorite)
                            .onTapGesture { selection = favorite }
                    }
                    .animation(.default, value: true)
                    .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                    .listRowBackground(Color.clear)
                    
                } //: LIST
                .sheet(item: $selection,
                       onDismiss: { self.selection = nil }) { favorite in
                    SingleRecipeView(recipe: favorite)
                }
                       .scrollContentBackground(.hidden)
            }
        } //: VStack
    }
}

//    MARK: - PREVIEW

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView()
    }
}
