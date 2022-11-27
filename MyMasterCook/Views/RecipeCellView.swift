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
        
        HStack {
            
            VStack {
                
                AsyncImage(
                    url: URL(string: recipe.thumbnail_url),
                    content: { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: thumbnailWidth, height: thumbnailWidth)
                    },
                    placeholder: {
                        ProgressView("Loading...")
                            .padding()
                            .tint(.white)
                            .background(Color(white: 0.2, opacity: 0.5))
                            .foregroundColor(.white)
                            .frame(alignment: .center)
                        
                    }
                )
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Colors.textColor, lineWidth: 2))
                .cornerRadius(12)
                .shadow(radius: 4)
                
            }
            
            VStack(alignment: .leading) {
                Text("\(recipe.name)")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(Colors.textColor)
                    .shadow(radius: 4)
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
        }
    }
}

struct RecipeCellView_Previews: PreviewProvider {
    static var previews: some View {
        
        let recipe = Recipe(id: "", name: "", thumbnail_url: "", video_url: "", instructions: "")
        
        RecipeCellView(recipe: recipe)
    }
}
