//
//  FavoritesListView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-12-26.
//

import SwiftUI

struct FavoritesListView: View {
    
    //    MARK: - PROPERTIES
    
    @State private var isFavoriteDataEmpty = false
    @State private var selection: Recipe? = nil
    @State private var showAlert = false
    
    @Binding var tabSelection: Int
    @StateObject var favoritesListVM: FavoritesListViewModel
    
    //    MARK: - BODY
    var body: some View {
        
        VStack {
            
            if favoritesListVM.favoriteArray.isEmpty {
                
                ZStack {

                    ActivityIndicator(shouldAnimate: $favoritesListVM.shouldAnimate)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                        .background( Color.black.opacity(0.7) )
                        .onAppear {
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                
                                print("Array count from recipe list: \(favoritesListVM.favoriteArray.count)")
                                if favoritesListVM.favoriteArray.isEmpty {
                                    showAlert.toggle()
                                    withAnimation { tabSelection = 1 }
                                }
                            }
                        }
                    Text("Loading...")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .tint(.white)
                        .padding(.top, 50)
                }
            } else {
                
                List(favoritesListVM.favoriteArray, id: \.id) { favorite in
                    
                    ZStack(alignment: .leading) {
                        
                        RecipeCellView(recipe: favorite)
                            .onTapGesture { selection = favorite }
                    }
                    .animation(.default, value: true)
                    .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                    .listRowBackground(Color.clear)
                    
                } //: LIST
                .sheet(item: $selection,
                       onDismiss: { self.selection = nil }) { favorite in
                    SingleRecipeView(recipe: favorite)
                }
                       .scrollContentBackground(.hidden)
            }
        } //: VStack
        .onAppear { favoritesListVM.checkFavDataEmpty() }
        .alert(isPresented: $showAlert) { Alert(title: Text("NO FAVORITES!!!"), message: Text("You have no favorite recipes"), dismissButton: .default(Text("OK")))}
    }
}

//    MARK: - PREVIEW

//struct FavoritesListView_Previews: PreviewProvider {
//    var tabSelected = 2
//    static var previews: some View {
//        FavoritesListView(tabSelection: tabSelected, favoritesListVM: FavoritesListViewModel())
//    }
//}
