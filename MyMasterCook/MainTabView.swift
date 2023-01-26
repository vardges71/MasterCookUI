//
//  MainTabView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-21.
//

import SwiftUI
import FirebaseAuth

struct MainTabView: View {
    
    //    MARK: - PROPERTIES
    
    @EnvironmentObject var user: User
    @State private var tabSelected = 1
    @State private var homeBadgeValue: Int?
    @State private var favoritesBadgeValue: Int?
    @State private var isFavoriteDataEmpty = false
    
    @StateObject var recipeVM: RecipeListViewModel
    @StateObject var searchVM: SearchViewModel
    @StateObject var favoritesListVM: FavoritesListViewModel
    
    //    MARK: - BODY
    
    var body: some View {
        
        TabView(selection: $tabSelected) {
            
            HomeView(tabSelection: $tabSelected, recipeListVM: recipeVM)
                .tabItem {
                    Label("home", systemImage: tabSelected == 0 ? "house.fill" : "house") .environment(\.symbolVariants, .none)
                    
                } .tag(0)
                .onChange(of: $recipeVM.recipeArray.count, perform: { newValue in
                    homeBadgeValue = newValue
                })
                .badge ( homeBadgeValue ?? 0 )
            
            SearchView(tabSelection: $tabSelected, searchVM: searchVM, recipeVM: recipeVM)
                .tabItem {
                    Label("search", systemImage: tabSelected == 1 ? "magnifyingglass.circle.fill" : "magnifyingglass.circle") .environment(\.symbolVariants, .none)
                    
                } .tag(1)
            
            FavoritesView(tabSelected: $tabSelected, favoritesListVM: favoritesListVM)
                .tabItem {
                    Label("favorites", systemImage: tabSelected == 2 ? "star.fill" : "star") .environment(\.symbolVariants, .none)
                    
                }
                .tag(2)
                .onChange(of: $favoritesListVM.favoriteArray.count, perform: { newValue in
                    favoritesBadgeValue = newValue
                })
                .badge ( favoritesBadgeValue ?? 0 )
            
            SettingsView(tabSelection: $tabSelected)
                .tabItem {
                    Label("settings", systemImage: tabSelected == 3 ? "gearshape.2.fill" : "gearshape.2")
                        .environment(\.symbolVariants, .none)
                    
                } .tag(3)
        }
        .accentColor(Colors.textColor)
        .onAppear() {
            favoritesListVM.checkFavDataEmpty()
            UITabBar.appearance().backgroundColor = UIColor(Colors.navbarTintColor)
            UITabBarItem.appearance().badgeColor = UIColor(Colors.tabbarBadgeColor)
            UITabBar.appearance().unselectedItemTintColor = UIColor(Colors.navbarUnselectedItemColor)
            //        UITabBar.appearance().tintColor = UIColor(Colors.textColor)
            UITabBar.appearance().barTintColor = UIColor(Colors.navbarTintColor)
            
            UINavigationBar.appearance().isTranslucent = true
            UINavigationBar.appearance().barTintColor = UIColor(Colors.navbarTintColor)
        }
    }
}

//    MARK: - PREVIEW
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(recipeVM: RecipeListViewModel(), searchVM: SearchViewModel(), favoritesListVM: FavoritesListViewModel()).environmentObject(User())
    }
}
