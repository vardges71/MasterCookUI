//
//  NutritionView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-12-18.
//

import SwiftUI

struct NutritionView: View {
    
//    MARK: - PROPERTIES

    let recipe: Recipe
    
//    MARK: - BODY
    var body: some View {
        Group {
            DisclosureGroup(content: {
                Divider()
                HStack{
                    VStack(alignment: .leading) {
                        Text("fiber: \(Utilities.optionalDoubleView(recipe.fiber))")
                        Text("proteine: \(Utilities.optionalDoubleView(recipe.protein))")
                        Text("fat: \(Utilities.optionalDoubleView(recipe.fat))")
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("sugar: \(Utilities.optionalDoubleView(recipe.sugar))")
                        Text("carbohydrates: \(Utilities.optionalDoubleView(recipe.carbohydrates))")
                        Text("calories: \(Utilities.optionalDoubleView(recipe.calories))")
                    }
                } .font(.system(size: 13))
            }, label: {
                Image(systemName: "info.circle")
                Text("Nutrition value")
            })
            .foregroundColor(Colors.textColor)
            .accentColor(Colors.textColor)
            .background(
                Color.clear
            )
        }
        .padding()
        .background(
            Color.white
                .opacity(0.6)
        )
        .cornerRadius(8)
    }
}

//  MARK: - PREVIEW

struct NutritionView_Previews: PreviewProvider {
    static var previews: some View {
        let recipes: [Recipe] = [Recipe]()
        NutritionView(recipe: recipes[0])
    }
}
