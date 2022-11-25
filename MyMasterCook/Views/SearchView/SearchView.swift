//
//  SearchView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-21.
//

import SwiftUI

struct SearchView: View {
    
    var backImageName = "backYellow"
    
    @Binding var tabSelection: Int
    @ObservedObject var recipeListVM = RecipeListViewModel()
    @ObservedObject var searchVM = SearchViewModel()
    
    let title = "Search"
    
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
                        SearchBtnView(searchVM: searchVM, tabSelection: $tabSelection)
                    } .padding(20)
                    
                    Spacer()
                } //: VSTACK
            } //: ZSTACK
            .navigationTitle(title)
            .navigationBarTitleTextColor(Colors.textColor)
        }
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
