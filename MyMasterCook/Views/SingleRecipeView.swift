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
    @State private var isAnimating: Bool = false
    
    var body: some View {
        
        ZStack {
            fullBackground(imageName: backImageName)
            VStack(spacing: 10) {
                
                AsyncImage(url: URL(string: recipe.thumbnail_url)) { image in
                    image.resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                } placeholder: {
                    ProgressView("Loading...")
                        .progressViewStyle(.circular)
                        .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                        .tint(.white)
                        .padding()
                        .background(Color(white: 0.2, opacity: 0.7))
                        .foregroundColor(.white)
                        
                } .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Colors.textColor, lineWidth: 1))
                    .shadow(radius: 4)

                HStack {
                    Text("\(recipe.name)")
                        .font(.title2)
                        .frame(alignment: .bottomLeading)
                        .fontWeight(.bold)
                        .foregroundColor(Colors.textColor)
                        .multilineTextAlignment(.leading)
                        .shadow(radius: 4)
                    Spacer()
                }
                ScrollView(.vertical, showsIndicators: false) {
                    Text(recipe.instructions)
                        .font(.footnote)
                } .padding(10)
                    .foregroundColor(Colors.textColor)
                    .background(Colors.alertBackgroundColor)
                    .frame(maxWidth: .infinity)
                Spacer()
            } .padding()
        }
        //        .navigationTitle("")
        .navigationBarTitleTextColor(Colors.textColor)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct SingleRecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleRecipeView(recipes: WebService().pub_recipe)
//    }
//}
