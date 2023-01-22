//
//  FavoritesView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-21.
//

import SwiftUI

struct FavoritesView: View {
    
//    MARK: - PROPERTIES
    
    var backImageName = "backYellow"
    @Binding var tabSelected: Int
    @StateObject var favoritesListVM: FavoritesListViewModel

    let title = "Favorites"
    
//    MARK: - BODY
    var body: some View {
        
        NavigationView {
            ZStack {
                fullBackground(imageName: backImageName)
                VStack(alignment: .leading) {
                    
                    FavoritesListView(tabSelection: $tabSelected, favoritesListVM: favoritesListVM)
                } // : VStack
            }
            .navigationTitle(title)
            .navigationBarTitleTextColor(Colors.textColor)
        }
    }
}

//  MARK: - PREVIEW

//struct FavoritesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesView()
//    }
//}
