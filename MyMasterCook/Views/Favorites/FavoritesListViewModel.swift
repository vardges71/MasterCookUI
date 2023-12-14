//
//  FavoritesListViewModel.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2023-01-20.
//

import Foundation

protocol UploadFavoriteDelegate: AnyObject {
    
    func uploadFavorites(_ favoriteRecipes: [Recipe])
}

class FavoritesListViewModel: ObservableObject {
    
    @Published var favoriteArray: [Recipe] = []
    @Published var favoriteArrayEmpty = false
    @Published var shouldAnimate = false
    
    func loadFavorites() {

        WebService().getFavoriteRecipes(favoriteListVM: self)
        print("LOAD FAVORITES")
    }
    
    func checkFavDataEmpty() {
        
        loadFavorites()
    }
}

extension FavoritesListViewModel: UploadFavoriteDelegate {
    
    func uploadFavorites(_ favoriteRecipes: [Recipe]) {
        
        self.favoriteArray = favoriteRecipes
        if favoriteArray.isEmpty {
            favoriteArrayEmpty.toggle()
            shouldAnimate = true
        }
    }
}
