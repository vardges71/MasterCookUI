//
//  SearchView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-18.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var tabSelection: Int
    let title = "Search"
    
    var body: some View {
        NavigationView {
            ZStack {
                fullBackground(imageName: "backYellow")
                VStack {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
            }
            .navigationTitle(title)
        }
    }
}

/*
#Preview {
    SearchView()
}
*/
