//
//  FavoritesView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-21.
//

import SwiftUI

struct FavoritesView: View {
    
    var backImageName = "backYellow"
    @Binding var tabSelection: Int
    let title = "Favorites"
    
    var body: some View {
        NavigationView {
            ZStack {
                fullBackground(imageName: backImageName)
                VStack(spacing: 20) {
                    Text("Favorites").foregroundColor(Colors.textColor)
                }.hidden()
            }
            .navigationTitle(title)
            .navigationBarTitleTextColor(Colors.textColor)
        }
    }
}

//struct FavoritesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesView()
//    }
//}
