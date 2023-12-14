//
//  RecipeVideoPlayerView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2023-01-22.
//

import SwiftUI
import AVKit

struct RecipeVideoPlayerView: View {
    
    //    MARK: - PROPERTIES
    
    let recipe: Recipe
    @State private var player: AVPlayer?
    
    //    MARK: - BODY
    var body: some View {
        
        VStack {
            VideoPlayer(player: player)
                .onAppear() {
                    // Start the player going, otherwise controls don't appear
                    guard let url = URL(string: recipe.video_url) else {
                        return
                    }
                    let player = AVPlayer(url: url)
                    self.player = player
                    
                    player.play()
                }
                .onDisappear() {
                    // Stop the player when the view disappears
                    player?.pause()
                }
                .frame(minWidth: UIScreen.main.bounds.width)
        } // VStack        
    }
}

//  MARK: - PREVIEW
struct RecipeVideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        let recipes: [Recipe] = [Recipe]()
        RecipeVideoPlayerView(recipe: recipes[0])
    }
}
