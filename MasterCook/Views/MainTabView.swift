//
//  MainTabView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-18.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject private var authServices: AuthServices
    @EnvironmentObject private var recipe: Recipe
    @EnvironmentObject private var webServices: WebServices
    
    @State private var tabSelected = 1
    @State private var homeBadgeValue: Int?
    @State private var favoritesBadgeValue: Int?
    
    var body: some View {
        
        TabView(selection: $tabSelected) {
            Group {
                HomeView(tabSelection: $tabSelected)
                    .tabItem {
                        Label("home", systemImage: tabSelected == 0 ? "house.fill" : "house") .environment(\.symbolVariants, .none)
                        
                    } .tag(0)
                    .onChange(of: webServices.recipeArray.count, { oldValue, newValue in
                        homeBadgeValue = newValue
                    })
                    .badge ( homeBadgeValue ?? 0 )
                
                SearchView(tabSelection: $tabSelected)
                    .tabItem {
                        Label("search", systemImage: tabSelected == 1 ? "magnifyingglass.circle.fill" : "magnifyingglass.circle") .environment(\.symbolVariants, .none)
                        
                    } .tag(1)
                if authServices.authState == .authorised {
                    FavoritesView(tabSelection: $tabSelected)
                        .tabItem {
                            Label("favorites", systemImage: tabSelected == 2 ? "star.fill" : "star") .environment(\.symbolVariants, .none)
                            
                        }
                        .tag(2)
                        .onChange(of: webServices.favoriteArray.count, { oldValue, newValue in
                            favoritesBadgeValue = newValue
                        })
                        .badge ( favoritesBadgeValue ?? 0 )
                }
                SettingsView(tabSelection: $tabSelected)
                    .tabItem {
                        Label("settings", systemImage: tabSelected == 3 ? "gearshape.2.fill" : "gearshape.2")
                            .environment(\.symbolVariants, .none)
                        
                    } .tag(3)
            }
        }
        .navigationBarTitleTextColor(Color.accentColor)
        .accentColor(Color("textColor"))
        .onAppear() {
            //            favoritesListVM.checkFavDataEmpty()
            //            UITabBar.appearance().backgroundColor = .navbarTint
            UITabBar.appearance().barTintColor = .navbarTint
            UITabBarItem.appearance().badgeColor = .tabbarBadge
            UITabBar.appearance().unselectedItemTintColor = .navbarUnselectedItem
            
            UINavigationBar.appearance().isTranslucent = true
            UINavigationBar.appearance().barTintColor = .navbarTint
        }
    }
}

#Preview {
    MainTabView()
}
