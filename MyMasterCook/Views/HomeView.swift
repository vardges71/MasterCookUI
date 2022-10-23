//
//  HomeView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-21.
//

import SwiftUI

struct HomeView: View {
    
    var backImageName = "backYellow"
    @Binding var tabSelection: Int
    let title = "My Mastercook"
    
    var body: some View {
        NavigationView {
            ZStack {
                fullBackground(imageName: backImageName)
                VStack(spacing: 20) {
                    Text("Home").foregroundColor(Colors.textColor)
                }
            }
            .navigationTitle(title)
            .navigationBarTitleTextColor(Colors.textColor)
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(tabSelection: self)
//    }
//}
