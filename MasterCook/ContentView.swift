//
//  ContentView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-11.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var authServices: AuthServices
    
    var body: some View {
        MainTabView()
    }
}

#Preview {
    ContentView()
}
