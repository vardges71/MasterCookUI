//
//  AboutView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-19.
//

import SwiftUI

struct AboutView: View {
    
    let title = "About"
    
    var body: some View {
        ZStack {
            fullBackground(imageName: "backYellow")
            VStack(spacing: 0) {
                AboutHeaderView()
                Divider()
                AboutTextView()
            }
        }
        .navigationTitle(title)
        .navigationBarTitleTextColor(Color.accentColor)
    }
}

#Preview {
    AboutView()
}
