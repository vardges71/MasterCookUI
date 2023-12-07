//
//  MyMasterCookApp.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-20.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct MyMasterCookApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            
            Group {
                
                if Auth.auth().currentUser != nil {
                    
                    // User is signed in.
                    MainTabView(recipeVM: RecipeListViewModel(), searchVM: SearchViewModel(), favoritesListVM: FavoritesListViewModel())
                    
                } else {
                    // No user is signed in.
                    ContentView()
                }
            } .preferredColorScheme(.light)
        }
    }
}
