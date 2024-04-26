//
//  FavoritesView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-18.
//

import SwiftUI

struct FavoritesView: View {
    
    @Binding var tabSelection: Int
    @EnvironmentObject private var webServices: WebServices
    let title = "Favorites"
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                fullBackground(imageName: "backYellow")
                VStack{
                    FavoritesListView(tabSelected: $tabSelection)
                }
            }
            .navigationTitle(title)
        }
    }
}

/*
#Preview {
    FavoritesView()
}
*/
