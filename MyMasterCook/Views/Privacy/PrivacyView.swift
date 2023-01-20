//
//  PrivacyView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-22.
//

import SwiftUI

struct PrivacyView: View {
    
    var backImageName = "backYellow"
    private var title = "PrivacyPolicy"
    private var privacyURL = "https://www.privacypolicies.com/live/183d1f01-e9cb-46d1-89e0-db3e27812277"
    @State private var showLoading: Bool = false
    
    var body: some View {
            
        ZStack {
            fullBackground(imageName: backImageName)
            VStack(spacing: 0) {
                
                PrivacyViewModel(url: URL(string: privacyURL)!, showLoading: $showLoading)
                    .overlay(showLoading ? ProgressView("Loading...")
                        .progressViewStyle(.circular)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                        .tint(.white)
                        .padding()
                        .background(Color(white: 0.2, opacity: 0.7))
                        .foregroundColor(.white)
                        .toAnyView() : EmptyView().toAnyView())
            }
        }
        .navigationTitle(title)
        .navigationBarTitleTextColor(Colors.textColor)
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}

extension View {
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}
