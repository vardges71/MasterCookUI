//
//  FavoritesView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-18.
//

import SwiftUI

struct FavoritesView: View {
    
    @Binding var tabSelection: Int
    let title = "Favorites"
    
    var body: some View {
        NavigationView {
            
            ZStack {
                fullBackground(imageName: "backYellow")
                VStack{
                    Text("HOME")
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
