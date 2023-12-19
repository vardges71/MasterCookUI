//
//  HomeView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-18.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var tabSelection: Int
    let title = "My MasterCook"
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                fullBackground(imageName: "backYellow")
                VStack{
                    Text("HOME")
                }
            }
            .navigationTitle(title)
        }
    }
}

/*
#Preview {
    
    HomeView()
}
*/
