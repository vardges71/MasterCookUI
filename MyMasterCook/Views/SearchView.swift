//
//  SearchView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-21.
//

import SwiftUI

struct SearchView: View {
    
    var backImageName = "backYellow"
    @Binding var tabSelection: Int
    let title = "Search"
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                fullBackground(imageName: backImageName)
                VStack(spacing: 20) {
                    Text("Search").foregroundColor(Colors.textColor)
                }
            }
            .navigationTitle(title)
            .navigationBarTitleTextColor(Colors.textColor)
        }
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
