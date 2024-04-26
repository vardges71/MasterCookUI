//
//  FavoritesListView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-23.
//

import SwiftUI

struct FavoritesListView: View {
    
    @EnvironmentObject private var webServices: WebServices
    
    @State private var shouldAnimate = false
    @State private var isShowAlert = false
    @State private var selectedRecipe: Recipe? = nil
    
    @Binding var tabSelected: Int
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        
        VStack {
            
            if webServices.favoriteArray.isEmpty {
                
                ZStack {
                    ProgressView("Loading...")
                        .padding()
                        .frame(width: screenWidth, height: screenHeight, alignment: .center)
                        .font(.system(size: 13))
                        .tint(.white)
                        .background(Color(UIColor(white: 0.3, alpha: 0.7)))
                        .foregroundColor(.white)
                        .onChange(of: webServices.favoriteDataEmpty, { oldValue, newValue in
                            isShowAlert = newValue
                            withAnimation {
                                tabSelected = 1
                            }
                        })
                }
            } else {
                
                List(webServices.favoriteArray, id: \.id) { favorite in
                    
                    ZStack(alignment: .leading) {
                        
                        RecipeCellView(selectedRecipe: favorite)
                            .onTapGesture { selectedRecipe = favorite }
                    }
                    .animation(.default, value: true)
                    .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                    .listRowBackground(Color.clear)
                    
                } //: LIST
                .sheet(item: $selectedRecipe,
                       onDismiss: { self.selectedRecipe = nil }) { favorite in
                    SingleRecipeView(selectedRecipe: favorite)
                }
                       .scrollContentBackground(.hidden)
            }
        } //: VStack
        .task {
            webServices.favoriteArray.removeAll()
            DispatchQueue.main.async {
                webServices.checkFavDataEmpty()
            }
        }
        .alert(isPresented: $isShowAlert) { Alert(title: Text("NO FAVORITES!!!"), message: Text("You have no favorite recipes"), dismissButton: .default(Text("OK")))}
    }
}

//#Preview {
//    FavoritesListView()
//}
