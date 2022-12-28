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
    @Binding var tabSelection: Int
    let title = "Favorites"
    
//    MARK: - BODY
    var body: some View {
        
        NavigationView {
            ZStack {
                fullBackground(imageName: backImageName)
                VStack(alignment: .leading) {
                    
                    FavoritesListView()
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
