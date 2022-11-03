//
//  SearchView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-21.
//

import SwiftUI

struct SearchView: View {
    
    var backImageName = "backYellow"
    
    @State private var showHomeView = false
    @Binding var tabSelection: Int
    
    @ObservedObject var recipeListVM = RecipeListViewModel()
    
    let title = "Search"
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                fullBackground(imageName: backImageName)
                VStack(spacing: 20) {
                    
                    Button {
                        
                        self.showHomeView.toggle()
                    
                    } label: {
                        
                        Label("search", systemImage: "doc.text.magnifyingglass")
                        
                    }
                    .modifier(ActionButtonModifier())
                    .background(Colors.buttonBackgroundColor)
                    .foregroundColor(Color.white)
                    
                    
                } .padding(20)
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
