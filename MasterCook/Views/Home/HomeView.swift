//
//  HomeView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-18.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var tabSelection: Int
    
    @EnvironmentObject private var webServices: WebServices
    
    let title = "My MasterCook"
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                fullBackground(imageName: "backYellow")
                VStack {
                    HomeRecipeListView(tabSelected: $tabSelection)
                }
            }
            .navigationTitle(title)
        }
    }
}

/*
 #Preview {
 
 HomeView()
 }
 */
