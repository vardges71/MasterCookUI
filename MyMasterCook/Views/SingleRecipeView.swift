//
//  SingleRecipeView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-22.
//

import SwiftUI

struct SingleRecipeView: View {
    
    var backImageName = "backYellow"
    var title = "Single recipe"
    
    var body: some View {
        
        ZStack {
            fullBackground(imageName: backImageName)
            VStack {
                AsyncImage(
                    url: URL(string: "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/video-api/assets/404698.jpg"),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxHeight: 300)
                    },
                    placeholder: {
                        ProgressView()
                    }
                ) .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Colors.textColor, lineWidth: 4))
                Spacer()
            }.padding(5)
        }
        .navigationTitle(title)
        .navigationBarTitleTextColor(Colors.textColor)
    }
}

struct SingleRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SingleRecipeView()
    }
}
