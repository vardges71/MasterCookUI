//
//  RecipeCellView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-11-02.
//

import SwiftUI

struct RecipeCellView: View {
    
    @State var recipe: Recipe
    @State private var thumbnailWidth: Double = UIScreen.main.bounds.width * 0.25
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                AsyncImage(
                    url: URL(string: recipe.thumbnail_url),
                    content: { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: thumbnailWidth, height: thumbnailWidth)
                    },
                    placeholder: {
                        ProgressView("Loading...")
                            .font(.system(size: 13))
                            .padding()
                            .tint(.white)
                            .background(Color(UIColor(white: 0.3, alpha: 0.7)))
                            .foregroundColor(.white)
                            .frame(alignment: .center)
                        
                    }
                )
                .clipShape(Rectangle())
//                .overlay(Rectangle().stroke(Colors.textColor, lineWidth: 2))
                .shadow(radius: 2)
                
                VStack(alignment: .leading) {
                    Text("\(recipe.name)")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(Colors.textColor)
                        .shadow(radius: 2)
                    Spacer()
                    Group {
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
                        } .foregroundColor(Colors.textColor)
                            .font(.system(size: 11))
                    }
                                        
                    Utilities.optionalIntView(recipe.num_servings)
                }
                Spacer()
            }
            Divider()
        }
    }
}

struct RecipeCellView_Previews: PreviewProvider {
    static var previews: some View {
        
        let recipe = Recipe(id: "", name: "", thumbnail_url: "", video_url: "", instructions: "", description: "")
        
        RecipeCellView(recipe: recipe)
    }
}

