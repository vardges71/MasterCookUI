//
//  MainTabView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-21.
//

import SwiftUI

struct MainTabView: View {
    
    @State public var tabSelected = 1
    
    init() { UITabBarItem.appearance().badgeColor = UIColor(Colors.tabbarBadgeColor) }
    
    var body: some View {
        
        TabView(selection: $tabSelected) {
            
            HomeView(tabSelection: $tabSelected)
                .tabItem {
                    Label("home", systemImage: tabSelected == 0 ? "house.fill" : "house") .environment(\.symbolVariants, .none)

                } .tag(0)
                .badge(40)
            
            SearchView(tabSelection: $tabSelected)
                .tabItem {
                    Label("search", systemImage: tabSelected == 1 ? "magnifyingglass.circle.fill" : "magnifyingglass.circle") .environment(\.symbolVariants, .none)

                } .tag(1)
            
            FavoritesView(tabSelection: $tabSelected)
                .tabItem {
                    Label("favorites", systemImage: tabSelected == 2 ? "star.fill" : "star") .environment(\.symbolVariants, .none)

                } .tag(2)
                .badge(5)
                
            SettingsView(tabSelection: $tabSelected)
                .tabItem {
                    Label("settings", systemImage: tabSelected == 3 ? "gearshape.2.fill" : "gearshape.2")
                        .environment(\.symbolVariants, .none)

                } .tag(3)
            
        }
        .accentColor(Colors.textColor)
        .onAppear() { UITabBar.appearance().backgroundColor = UIColor(Colors.navbarTintColor) }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
