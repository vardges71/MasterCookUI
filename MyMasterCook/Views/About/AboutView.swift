//
//  AboutView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-22.
//

import SwiftUI

struct AboutView: View {
    
    var backImageName = "backYellow"
    let title = "About"
    
    var body: some View {
        ZStack {
            fullBackground(imageName: backImageName)
            VStack(spacing: 0) {
                AboutHeaderView()
                Divider()
                AboutTextView()
            }
        }
        .navigationTitle(title)
        .navigationBarTitleTextColor(Colors.textColor)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
