//
//  GuestButtonView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-24.
//

import SwiftUI
import FirebaseAuth

struct GuestButtonView: View {
    
//    MARK: - PROPERTIES
    
    @State private var showMainView = false
    
//    MARK: - BODY
    var body: some View {
        
        Button {
            self.showMainView.toggle()
            
        } label: {
            Text("continue as guest")
                .modifier(ActionButtonModifier())
                .background(Colors.darkGrey)
        }
        .fullScreenCover(isPresented: $showMainView) {
            if Auth.auth().currentUser != nil {
                MainTabView(recipeVM: RecipeListViewModel(), searchVM: SearchViewModel(), favoritesListVM: FavoritesListViewModel())
            } else {
                SecondaryTabView(recipeVM: RecipeListViewModel(), searchVM: SearchViewModel())
            }
        }
    }
}

//  MARK: - PREVIEW

//struct GuestButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        GuestButtonView(isLoading: isLoading)
//    }
//}
