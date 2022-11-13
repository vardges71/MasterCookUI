//
//  SearchListView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-11-11.
//

import SwiftUI

struct SearchListView: View {
    
    @ObservedObject var searchVM: SearchViewModel
    
    var body: some View {
        List {
            ForEach(0..<searchVM.ingredientArray.count, id: \.self) { index in
                VStack(alignment: .leading) {
                    Text("\(searchVM.ingredientArray[index])")
                        .swipeActions(allowsFullSwipe: false) {

                            Button(role: .destructive) {

                                searchVM.ingredientArray.remove(at: index)
                            } label: {

                                Label("Delete", systemImage: "trash")
                            } .tint(Colors.tabbarBadgeColor)
                        }
                        .foregroundColor(Colors.textColor)
                    Divider()
                }.listRowBackground(Color.clear)
            }
        } .frame(height: UIScreen.main.bounds.height / 3)
            .scrollContentBackground(.hidden)
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView(searchVM: SearchViewModel())
    }
}
