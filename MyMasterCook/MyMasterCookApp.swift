//
//  MyMasterCookApp.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-20.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore

@main
struct MyMasterCookApp: App {
    
    init() { FirebaseApp.configure() }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
