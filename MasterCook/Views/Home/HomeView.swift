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
                    List {
                        ForEach (webServices.recipeArray, id: \.id) { recipe in
                            
                            VStack(alignment: .leading) {
                                Text(recipe.name)
                                    .animation(.default, value: true)
                                Divider()
                            }
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .foregroundStyle(Color.accentColor)
                    } //: LIST
                    .scrollContentBackground(.hidden)
                }
            }
            .navigationTitle(title)
        }
    }
    
    func checkRecipeDataEmpty() {
        
        if webServices.recipeArray.count == 0 {
            
            Task {
                do {
                    
                    try await webServices.fetchRecipes()
                    print("You fetch \(webServices.recipeArray.count) recipes")
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

/*
 #Preview {
 
 HomeView()
 }
 */
