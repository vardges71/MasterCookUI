//
//  SingleRecipeView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-22.
//

import SwiftUI

struct SingleRecipeView: View {
    
    let recipe: Recipe
    
    var backImageName = "backYellow"
    var title = "Single recipe"
    
    var body: some View {
        
        ZStack {
            fullBackground(imageName: backImageName)
            VStack(alignment: .leading) {
                GeometryReader { metrics in
                    AsyncImage(
                        url: URL(string: recipe.thumbnail_url),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: metrics.size.width, height: metrics.size.height)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    ) .clipShape(Rectangle())
                        .overlay(Rectangle().stroke(Colors.textColor, lineWidth: 1))
                }
                
                Text(recipe.name)
                    .padding(5)
                    .font(.title2)
                    .frame(alignment: .bottomLeading)
                    .fontWeight(.bold)
                    .foregroundColor(Colors.textColor)
                
                ScrollView {
                    Text(recipe.instructions)
                        .font(.footnote)
                } .padding(10)
                    .foregroundColor(Colors.textColor)
                    .background(Colors.alertBackgroundColor)
                    .frame(maxWidth: .infinity)
                
                Spacer()
            } .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
//        .navigationTitle("")
        .navigationBarTitleTextColor(Colors.textColor)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SingleRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SingleRecipeView(recipe: Recipe(id: "id",
                                        name: "name",
                                        thumbnail_url: "",
                                        video_url: "",
                                        instructions: ""))
    }
}
