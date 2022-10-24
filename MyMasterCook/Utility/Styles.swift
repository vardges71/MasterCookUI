//
//  Styles.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-20.
//

import SwiftUI

public extension View {
    
    func fullBackground(imageName: String) -> some View {
        
        GeometryReader { proxy in
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: proxy.size.width, height: proxy.size.height)
                .clipped()
        }.ignoresSafeArea()
    }
    
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        
        // Set appearance for both normal and large sizes.
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        
        return self
    }
}

struct TextFieldModifier: ViewModifier {
    
    
    func body(content: Content) -> some View {
        
        content
            .foregroundColor(Colors.textColor)
            .accentColor(Colors.textColor)
    }
}

struct ActionButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .padding()
            .font(.system(size: 17.0))
            .frame(maxWidth: .infinity, maxHeight: 44)
    }
}
