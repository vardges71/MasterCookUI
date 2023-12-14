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
        ZStack {
            fullBackground(imageName: "backYellow")
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                Button("log out") {
                    logout()
                }
            }
            .padding()
        }
    }
    
    func logout() {
        do {
            try authServices.logout()
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
