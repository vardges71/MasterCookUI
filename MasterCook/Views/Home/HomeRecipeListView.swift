//
//  HomeRecipeListView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-20.
//

import SwiftUI

struct HomeRecipeListView: View {
    
    @EnvironmentObject private var webServices: WebServices
    
    @State private var shouldAnimate = false
    @State private var isShowAlert = false
    @State private var selectedRecipe: Recipe? = nil
    
    @Binding var tabSelected: Int
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        
        VStack {
            
            if webServices.recipeArray.isEmpty {
                
                ZStack {
                    ProgressView("Loading...")
                        .padding()
                        .frame(width: screenWidth, height: screenHeight, alignment: .center)
                        .font(.system(size: 13))
                        .tint(.white)
                        .background(Color(UIColor(white: 0.3, alpha: 0.7)))
                        .foregroundColor(.white)
                        .onChange(of: webServices.recipeDataEmpty, { oldValue, newValue in
                            
                            isShowAlert = newValue
                            withAnimation {
                                tabSelected = 1
                            }
                        })
                }
            } else {
                
                List(webServices.recipeArray, id: \.id) { recipe in
                    
                    RecipeCellView(selectedRecipe: recipe)
                        .onTapGesture { selectedRecipe = recipe }
                        .animation(.default, value: true)
                        .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    
                }
                .scrollContentBackground(.hidden)
                .sheet(item: $selectedRecipe,
                       onDismiss: { selectedRecipe = nil }) { recipe in
                    SingleRecipeView(selectedRecipe: recipe)
                }
            }
        }
        .onAppear {
            
            DispatchQueue.main.async {
                
                if webServices.recipeArray.count == 0 {
                    Task {
                        
                        do {
                            try await webServices.fetchRecipes()
                        }
                    }
                }
            }
        }
        .alert(isPresented: $isShowAlert) { Alert(title: Text("Error..."), message: Text("No result for your keyword"), dismissButton: .default(Text("OK")))}
    }
}

//#Preview {
//    HomeRecipeListView()
//}
