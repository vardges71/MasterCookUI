//
//  ActivityIndicator.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2023-01-11.
//

import Foundation
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    @Binding var shouldAnimate: Bool
    let myActivityIndicator = UIActivityIndicatorView()
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        
        myActivityIndicator.color = .white
        
        return myActivityIndicator
    }

    func updateUIView(_ uiView: UIActivityIndicatorView,
                      context: Context) {
        if self.shouldAnimate {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}
