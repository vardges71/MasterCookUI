//
//  SearchListView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-19.
//

import SwiftUI

struct SearchListView: View {
    
    @EnvironmentObject private var webServices: WebServices
    
    var body: some View {
        
        List {
            ForEach(0..<webServices.ingredients.count, id: \.self) { index in
                VStack(alignment: .leading, spacing: 5) {
                    Text(webServices.ingredients[index])
                        .swipeActions(allowsFullSwipe: true) {
                            
                            Button(role: .destructive) {
                                
                                webServices.ingredients.remove(at: index)
                            } label: {
                                
                                Label("Delete", systemImage: "trash")
                            } .tint(Color.tabbarBadge)
                        }
                        .foregroundStyle(Color.accentColor)
                    Divider()
                }
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }
        .scrollContentBackground(.hidden)
        .frame(maxHeight: UIScreen.main.bounds.height / 3.3)
    }
}

#Preview {
    SearchListView()
}
