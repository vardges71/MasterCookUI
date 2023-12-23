//
//  SearchButtonView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-19.
//

import SwiftUI

struct SearchButtonView: View {
    
    @EnvironmentObject private var webServices: WebServices
    @State private var showAlert = false
    @Binding var tabSelection: Int
    
    let errorSentence = """
Please enter ingredient or cuisine and tap "+", to add in search list
"""
    
    //    MARK: - BODY
    
    var body: some View {
        
        Button {
            
            ifIngredientIsEmpty()
            webServices.recipeArray.removeAll()
            
        } label: {
            
            Label("search", systemImage: "doc.text.magnifyingglass")
                .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
                .background(Color.buttonBackground)
                .foregroundStyle(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0).stroke(.white, lineWidth: 2)
                )
        }
        .alert(isPresented: self.$showAlert) { Alert(title: Text(" "), message: Text("\(errorSentence)"), dismissButton: .default(Text("OK"))) }
    }
    
    func ifIngredientIsEmpty() {
        
        if webServices.ingredients.isEmpty {
            
            self.showAlert.toggle()
            
        } else {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {

                withAnimation {
                    tabSelection = 0
                }
            }
        }
    }
}

/*
#Preview {
    SearchButtonView()
}
*/
