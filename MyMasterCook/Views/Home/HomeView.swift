//
//  HomeView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-21.
//

import SwiftUI

struct HomeView: View {
    
    //    MARK: - PROPERTIES
    
    var backImageName = "backYellow"
    @Binding var tabSelection: Int
    @StateObject var recipeListVM: RecipeListViewModel
    let title = "My MasterCook"
    
    
    //    MARK: - BODY
    
    var body: some View {
        
        NavigationView {
            ZStack {
                fullBackground(imageName: backImageName)
                VStack(alignment: .leading) {
                    
                    RecipeListView(tabSelection: $tabSelection, recipeListVM: recipeListVM)
                    
                } // : VStack
            }
            .navigationTitle(title)
            .navigationBarTitleTextColor(Colors.textColor)
        }
    }
}

//  MARK: - PREVIEW

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        HomeView(tabSelection: $tabSelection)
//    }
//}


