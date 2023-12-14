//
//  SearchView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-21.
//

import SwiftUI

struct SearchView: View {
    
//    MARK: - PROPERTIES
    var backImageName = "backYellow"
    
    @Binding var tabSelection: Int
    @StateObject var searchVM: SearchViewModel
    @StateObject var recipeVM: RecipeListViewModel
    
    let title = "Search"
    
//    MARK: - BODY
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                fullBackground(imageName: backImageName)
                VStack {
                    
                    SearchListView(searchVM: searchVM)
                    
                    HStack {
                        SearchTextFieldView(searchVM: searchVM)
                        Spacer(minLength: 20)
                        AddIngredientBtnView(searchVM: searchVM)
                    } .padding(20)
                    
                    HStack {
                        ClearBtnView(searchVM: searchVM)
                        Spacer(minLength: 20)
                        SearchBtnView(searchVM: searchVM, recipeVM: recipeVM, tabSelection: $tabSelection)
                    } .padding(20)
                    
                    Spacer()
                } //: VSTACK
            } //: ZSTACK
            .navigationTitle(title)
            .navigationBarTitleTextColor(Colors.textColor)
            .onAppear {
                UserDefaults.standard.removeObject(forKey: "urlIngredient")
                searchVM.ingredientArray.removeAll()
            }
        }
    }
}

//  MARK: - PREVIEW

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
