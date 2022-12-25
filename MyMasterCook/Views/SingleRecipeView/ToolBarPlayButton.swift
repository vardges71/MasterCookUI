//
//  ToolBarPlayButton.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-12-25.
//

import SwiftUI

struct ToolBarPlayButton: View {
    var body: some View {
        Button {
            print("Play Button")
        } label: {
            VStack {
                Image(systemName: "play")
                Text("play video")
                    .font(.caption)
            }
            .foregroundColor(Colors.textColor)
        }
    }
}

struct ToolBarPlayButton_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarPlayButton()
    }
}
