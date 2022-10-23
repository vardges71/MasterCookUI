//
//  AboutView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-22.
//

import SwiftUI

struct AboutView: View {
    
    var backImageName = "backYellow"
    
    var body: some View {
        
        ZStack {
            fullBackground(imageName: backImageName)
            Text("ABOUT")
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
