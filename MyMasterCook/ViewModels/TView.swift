//
//  TView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-25.
//

import SwiftUI

struct TView: View {
    
    @State public var tabSelected = 1
    
    init() {
        UITabBarItem.appearance().badgeColor = UIColor(Colors.tabbarBadgeColor)
        UITabBar.appearance().unselectedItemTintColor = UIColor(Colors.textColor)
        UITabBar.appearance().backgroundColor = UIColor(Colors.navbarTintColor)
    }
    
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
                
            SettingsView(tabSelection: $tabSelected)
                .tabItem {
                    Label("settings", systemImage: tabSelected == 3 ? "gearshape.2.fill" : "gearshape.2")
                        .environment(\.symbolVariants, .none)

                } .tag(3)
            
        }
        .accentColor(Colors.textColor)
//        .onAppear() { UITabBar.appearance().backgroundColor = UIColor(Colors.navbarTintColor) }
    }
}

struct TView_Previews: PreviewProvider {
    static var previews: some View {
        TView()
    }
}
