//
//  NutritionView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-23.
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
                            Text("fiber: \(optionalDoubleView(recipe.fiber))")
                            Text("proteine: \(optionalDoubleView(recipe.protein))")
                            Text("fat: \(optionalDoubleView(recipe.fat))")
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("sugar: \(optionalDoubleView(recipe.sugar))")
                            Text("carbohydrates: \(optionalDoubleView(recipe.carbohydrates))")
                            Text("calories: \(optionalDoubleView(recipe.calories))")
                        }
                    } .font(.system(size: 13))
                }, label: {
                    Image(systemName: "info.circle")
                    Text("Nutrition value")
                })
                .foregroundStyle(Color.accentColor)
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

#Preview {
    NutritionView(recipe: Recipe())
}
