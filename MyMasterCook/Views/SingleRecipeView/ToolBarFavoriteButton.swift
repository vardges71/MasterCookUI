//
//  ToolBarFavoriteButton.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-12-25.
//

import SwiftUI

struct ToolBarFavoriteButton: View {
    var body: some View {
        Button {
            print("Favorite Button")
        } label: {
            VStack {
                Image(systemName: "star")
                Text("favorite")
                    .font(.caption)
            }
            .foregroundColor(Colors.textColor)
        }
    }
}

struct ToolBarFavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarFavoriteButton()
    }
}
