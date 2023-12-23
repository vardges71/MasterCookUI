//
//  HomeRecipeListView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-20.
//

import SwiftUI

struct HomeRecipeListView: View {
    
    @EnvironmentObject private var webServices: WebServices
    
    @State private var selection: Recipe? = nil
    @State private var shouldAnimate = false
    @State private var isShowAlert = false
    
    @Binding private var tabSelected: Int
    
    var body: some View {
        
        VStack {
            
            if webServices.recipeArray.isEmpty {
                
                ZStack {

                    ProgressView(shouldAnimate: $shouldAnimate)
//                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                        .background( Color.black.opacity(0.7) )
                        .onChange(of: webServices.recipeArray.isEmpty, { oldValue, newValue in
                            isShowAlert = newValue
                            withAnimation {
                                tabSelected = 1
                            }
                        })
                    Text("Loading...")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .tint(.white)
                        .padding(.top, 50)
                }
            } else {
                
                List(webServices.recipeArray, id: \.id) { recipe in
                    
                    RecipeCellView(recipe: recipe)
                        .onTapGesture { selection = recipe }
                        .animation(.default, value: true)
                        .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    
                }
                .scrollContentBackground(.hidden)
                .sheet(item: $selection,
                       onDismiss: { selection = nil }) { recipe in
                    SingleRecipeView(recipe: recipe)
                }
            }
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
    
        .onAppear {
            checkRecipeDataEmpty()
        }
}

#Preview {
    HomeRecipeListView()
}
