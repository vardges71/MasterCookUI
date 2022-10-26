//
//  MyMasterCookApp.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-20.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct MyMasterCookApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            
            if Auth.auth().currentUser != nil {
                
                // User is signed in.
                MainTabView()
                
            } else {
                // No user is signed in.
                ContentView()
            }
        }
    }
}
