//
//  ToolBarPlayButton.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-12-25.
//

import SwiftUI
import AVKit

struct ToolBarPlayButton: View {
    //    MARK: - PROPERTIES
    
    let recipe: Recipe
    
    @State private var isPresented: Bool = false
    @State private var isShowVideoAlert: Bool = false
    
    //    MARK: - BODY
    var body: some View {
        VStack {
            Button {
                
                if recipe.video_url == "" {
                    isShowVideoAlert.toggle()
                } else {
                    isPresented.toggle()
                }
                print("Play button: \(recipe.video_url)")
                
            } label: {
                VStack {
                    Image(systemName: "play")
                    Text("play video")
                        .font(.caption)
                }
                .foregroundColor(Colors.textColor)
            }
        } // VStack
        .sheet(isPresented: $isPresented) { RecipeVideoPlayerView(recipe: recipe) }
        .alert(isPresented: $isShowVideoAlert) { Alert(title: Text("Sorry..."), message: Text("The video instruction for this recipe is not available"), dismissButton: .default(Text("OK")))}
    }
}

//  MARK: - PREVIEW
struct ToolBarPlayButton_Previews: PreviewProvider {
    static var previews: some View {
        let recipes: [Recipe] = [Recipe]()
        ToolBarPlayButton(recipe: recipes[0])
    }
}
