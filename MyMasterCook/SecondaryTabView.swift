//
//  TView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-25.
//

import SwiftUI
import FirebaseAuth

struct SecondaryTabView: View {
    
    @State var tabSelected: Int = 1
    @StateObject var recipeListVM = RecipeListViewModel()
    @State private var homeBadgeValue: Int?
    
    var body: some View {
        
        TabView(selection: $tabSelected) {
            
            HomeView(tabSelection: $tabSelected)
                .tabItem {
                    Label("home", systemImage: tabSelected == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, .none)
                }
                .tag(0)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        print("FROM STV: \(recipeData.count)")
                        homeBadgeValue = recipeData.count
                    }
                }
                .badge ( homeBadgeValue ?? 0 )
                
            
            SearchView(tabSelection: $tabSelected)
                .tabItem {
                    Label("search", systemImage: tabSelected == 1 ? "magnifyingglass.circle.fill" : "magnifyingglass.circle") .environment(\.symbolVariants, .none)
                }
                .tag(1)
            
            SettingsView(tabSelection: $tabSelected)
                .tabItem {
                    Label("settings", systemImage: tabSelected == 3 ? "gearshape.2.fill" : "gearshape.2")
                        .environment(\.symbolVariants, .none)
                }
                .tag(3)
        }
        .accentColor(Colors.textColor)
        .onAppear() {
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

//struct SecondaryTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondaryTabView()
//    }
//}

