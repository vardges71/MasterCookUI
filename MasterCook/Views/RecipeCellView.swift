//
//  RecipeCellView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-21.
//

import SwiftUI

struct RecipeCellView: View {
    
    //    MARK: - PROPERTIES
    
    let selectedRecipe: Recipe
    
        let thumbnailWidth: Double = UIScreen.main.bounds.width * 0.25
        
    //    MARK: - BODY
        var body: some View {
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    ZStack {
                        Rectangle()
                            .stroke(Color.accentColor, lineWidth: 1)
                            .frame(width: thumbnailWidth + 1, height: thumbnailWidth + 1)
                            
                        AsyncImage(
                            url: URL(string: selectedRecipe.thumbnail_url),
                            content: { image in
                                image.resizable()
                                    .scaledToFill()
                                    .frame(width: thumbnailWidth, height: thumbnailWidth)
                            },
                            placeholder: {
                                EmptyView()
                            }
                        )
                        .clipShape(Rectangle())
                    }
                    .padding(.leading, 2)
                    VStack(alignment: .leading) {
                        Text("\(selectedRecipe.name)")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundStyle(Color.accentColor)
                            .shadow(radius: 2)
                            .lineLimit(2)
                        Spacer()
                        Group {
                            HStack{
                                VStack(alignment: .leading) {
                                    Text("fiber: \(optionalDoubleView(selectedRecipe.fiber))")
                                    Text("proteine: \(optionalDoubleView(selectedRecipe.protein))")
                                    Text("fat: \(optionalDoubleView(selectedRecipe.fat))")
                                }
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Text("sugar: \(optionalDoubleView(selectedRecipe.sugar))")
                                    Text("carbohydrates: \(optionalDoubleView(selectedRecipe.carbohydrates))")
                                    Text("calories: \(optionalDoubleView(selectedRecipe.calories))")
                                }
                            } .foregroundStyle(Color.accentColor)
                                .font(.system(size: 11))
                        }
//                                            
                        optionalIntView(selectedRecipe.num_servings)
                    }
                    Spacer()
                }
                Divider()
            }
        }
}

//#Preview {
//    RecipeCellView()
//}
