//
//  SearchBtnView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-11-11.
//

import SwiftUI

struct SearchBtnView: View {
    
    //    MARK: - PROPERTIES
    
    @StateObject var searchVM: SearchViewModel
    @StateObject var recipeVM: RecipeListViewModel
    @Binding var tabSelection: Int
    
    @State private var showAlert = false
    
    //    MARK: - BODY
    
    var body: some View {
        Button {
            
            recipeVM.recipeArray.removeAll()
            UserDefaults.standard.removeObject(forKey: "urlIngredient")
            
            ifIngredientIsEmpty()
            
        } label: {
            
            Label("search", systemImage: "doc.text.magnifyingglass")
                .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
                .background(Colors.buttonBackgroundColor)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0).stroke(.white, lineWidth: 2)
                )
        }
        .alert(isPresented: self.$showAlert) { Alert(title: Text(" "), message: Text("Please enter ingredient or cuisine"), dismissButton: .default(Text("OK"))) }
    }
    
    func ifIngredientIsEmpty() {
        
        if searchVM.ingredientArray.isEmpty {
            
            self.showAlert.toggle()
            
        } else {
            
            let allowedCharacterSet = CharacterSet.urlQueryAllowed
            
            let ing = searchVM.ingredientArray.joined(separator: ",")
            let replasedIngredient = ing.replacingOccurrences(of: ",", with: "%2C")
            let ingredientsForURL = replasedIngredient.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)
            
            UserDefaults.standard.set(ingredientsForURL, forKey: "urlIngredient")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {

                withAnimation {
                    tabSelection = 0
                }
            }
        }
    }
}

//  MARK: - PREVIEW

//struct SearchBtnView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBtnView()
//    }
//}
