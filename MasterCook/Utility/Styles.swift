//
//  Styles.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-14.
//

import SwiftUI

public extension View {
    
    func fullBackground(imageName: String) -> some View {
        
        GeometryReader { proxy in
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)

        } .edgesIgnoringSafeArea(.all)
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
            .foregroundStyle(Color("textColor"))
            .accentColor(Color("textColor"))
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

struct Divider: View {
    var body: some View {

        Rectangle().frame(height: 1)
            .foregroundStyle(Color("textColor"))
    }
}
