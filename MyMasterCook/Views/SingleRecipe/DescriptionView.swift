//
//  DescriptionView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2023-01-02.
//

import SwiftUI

struct DescriptionView: View {
//    MARK: - PROPERTIES
    
    let recipe: Recipe
//    MARK: - BODY
    var body: some View {
        Group {
            DisclosureGroup(content: {
                Divider()
                VStack{
                    Text("\(recipe.description)")
                } .font(.system(size: 13))
            }, label: {
                Image(systemName: "info.circle")
                Text("Description")
            })
            .foregroundColor(Colors.textColor)
            .accentColor(Colors.textColor)
            .background(
                Color.clear
            )
        }
        .padding()
        .background(
            Color.white
                .opacity(0.6)
        )
        .cornerRadius(8)
    }
}

//  MARK: - PREVIEW
struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        let recipes: [Recipe] = [Recipe]()
        DescriptionView(recipe: recipes[0])
    }
}
