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
    
    func hideKeyboard() {
        
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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
            .frame(width: UIScreen.main.bounds.width - 40, height: 44, alignment: .center)
            .font(.system(size: 17.0))
            .foregroundColor(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 5.0).stroke(.white, lineWidth: 2)
            )
    }
}
