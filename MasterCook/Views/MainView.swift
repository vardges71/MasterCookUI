//
//  MainView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-14.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var authServices: AuthServices

    var body: some View {
        
        Group {
            switch authServices.authState {
                
            case .undefined:
                ProgressView()
            case .authorised:
                ContentView()
            case .notAuthorised:
                LoginView()
            }
        }
    }
}

#Preview {
    MainView()
}
