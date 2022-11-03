//
//  RecipeCellView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-11-02.
//

import SwiftUI

struct RecipeCellView: View {
    
    let recipe: Recipe
    
    var body: some View {
        
        return HStack {
            
            VStack {
                GeometryReader { metrics in
                    AsyncImage(
                        url: URL(string: recipe.thumbnail_url),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: 100, maxHeight: 100, alignment: .center)
                            
                        },
                        placeholder: {
                            ProgressView()
                                .tint(.white)
                                .background(Color(white: 0.3, opacity: 0.7))
                        }
                    ) .clipShape(Rectangle())
                        .overlay(Rectangle().stroke(Colors.textColor, lineWidth: 2))
                }
            }
            .frame(width: 100, height: 100, alignment: .leading)
            VStack {
                Text("\(recipe.name)")
                    .font(.system(size: 19))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Colors.textColor)
                Spacer()
                Group {
                    
                }
            }
        }
    }
}

struct RecipeCellView_Previews: PreviewProvider {
    static var previews: some View {
        
        let recipe = Recipe(id: "",
                            name: "Air Fryer Peach Cobbler For 2",
                            thumbnail_url: "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/video-api/assets/404698.jpg",
                            video_url: "",
                            instructions: "")
        
        RecipeCellView(recipe: recipe)
    }
}
