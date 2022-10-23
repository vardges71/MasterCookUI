//
//  SingleRecipeView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-22.
//

import SwiftUI

struct SingleRecipeView: View {
    
    var backImageName = "backYellow"
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                fullBackground(imageName: backImageName)
                Text("Single RECIPE")
            }
        }
    }
}

struct SingleRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SingleRecipeView()
    }
}
