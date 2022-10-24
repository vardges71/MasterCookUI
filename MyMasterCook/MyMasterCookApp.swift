//
//  MyMasterCookApp.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-20.
//

import SwiftUI
import FirebaseCore

@main
struct MyMasterCookApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
