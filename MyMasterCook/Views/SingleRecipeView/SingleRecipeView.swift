//
//  SingleRecipeView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-22.
//

import SwiftUI

struct SingleRecipeView: View {
    
    //    MARK: - PROPERTIES
    
    let recipe: Recipe
    
    var backImageName = "backYellow"
    var title = "Single recipe"
    @State private var isAnimating: Bool = false
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    //    MARK: - BODY
    
    var body: some View {
        
        ZStack {
            fullBackground(imageName: backImageName)
            VStack(alignment: .center, spacing: 10) {
                ZStack {
                    Rectangle()
                        .stroke(Colors.textColor, lineWidth: 1)
                        .frame(width: screenWidth - 1, height: (screenHeight * 0.3) + 1)
                    AsyncImage(url: URL(string: recipe.thumbnail_url)) { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: screenWidth - 2, height: screenHeight * 0.3, alignment: .center)
                    } placeholder: {
                        ProgressView("Loading...")
                            .padding()
                            .frame(width: screenWidth - 2, height: screenHeight * 0.3, alignment: .center)
                            .font(.system(size: 13))
                            .tint(.white)
                            .background(Color(UIColor(white: 0.3, alpha: 0.7)))
                            .foregroundColor(.white)
                    }
                    .clipShape(Rectangle())
                    .overlay(
                        Text("\(recipe.name)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Colors.textColor)
                            .multilineTextAlignment(.leading)
                            .shadow(radius: 4)
                            .padding(10)
                            .background(
                                Color.white
                                    .cornerRadius(8)
                                    .opacity(0.6)
                            )
                            .padding()
                        , alignment: .topLeading
                    )
                }
                if recipe.calories != nil {
                    NutritionView(recipe: recipe)
                        .padding(.horizontal)
                        .padding(.top, 10)
                }
                ScrollView(.vertical, showsIndicators: false) {
                    Text(recipe.instructions)
                        .font(.footnote)
                } .padding()
                    .foregroundColor(Colors.textColor)
                    .frame(width: screenWidth)
                Spacer()
                SingleRecipeToolBar()
                    .frame(alignment: .bottom)
            }
        }
        //        .navigationTitle("\(recipe.name)")
        //        .navigationBarTitleTextColor(Colors.textColor)
        //        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - PREVIEW

struct SingleRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        let recipes: [Recipe] = [Recipe]()
        SingleRecipeView(recipe: recipes[0])
    }
}
