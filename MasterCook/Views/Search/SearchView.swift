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
                    SearchListView()
                    VStack(spacing: 20) {
                        HStack {
                            SearchTextFieldView()
                            Spacer(minLength: 10)
                            AddButtonView()
                        }
                        HStack {
                            ClearButtonView()
                            Spacer(minLength: 20)
                            SearchButtonView(tabSelection: $tabSelection)
                        }
                    } .padding()
                    Spacer()
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
