//
//  ClearBtnView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-11-11.
//

import SwiftUI

struct ClearBtnView: View {
    
    @StateObject var searchVM: SearchViewModel
    
    var body: some View {
        
        Button {
            searchVM.clearIngredients.toggle()
            searchVM.clearIngredient()
            print("Ingredient Array count: \(searchVM.ingredientArray.count)")
            
        } label: {
            Label("clear", systemImage: "trash")
                .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
                .background(Colors.alertBackgroundColor)
                .foregroundColor(Colors.textColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0).stroke(Colors.textColor, lineWidth: 2)
                )
        }
    }
}

struct ClearBtnView_Previews: PreviewProvider {
    static var previews: some View {
        ClearBtnView(searchVM: SearchViewModel())
    }
}
