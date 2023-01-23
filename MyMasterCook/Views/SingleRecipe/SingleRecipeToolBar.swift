//
//  SingleRecipeTabBar.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-12-24.
//

import SwiftUI

struct SingleRecipeToolBar: View {
    
    //    MARK: - PROPERTIES
    let recipe: Recipe
    
    //    MARK: - BODY
    var body: some View {

        ZStack {
            HStack {
                ToolBarPlayButton(recipe: recipe)
                Spacer()
                ToolBarPrintButton(recipe: recipe)
                Spacer()
                ToolBarFavoriteButton(recipe: recipe, favoritesListVM: FavoritesListViewModel())
            } //HSTACK
            .padding(.horizontal)
        } //ZSTACK
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.05)
        .background(Colors.navbarTintColor)
    }
}

//  MARK: - PREVIEW

struct SingleRecipeTabBar_Previews: PreviewProvider {
    static var previews: some View {
        let recipes: [Recipe] = [Recipe]()
        SingleRecipeToolBar(recipe: recipes[0])
    }
}
