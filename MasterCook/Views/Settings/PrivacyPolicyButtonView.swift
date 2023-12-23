//
//  PrivacyPolicyButtonView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-19.
//

import SwiftUI

struct PrivacyPolicyButtonView: View {
    
    @State private var showPrivacyView = false
    @State private var privacyView = PrivacyView()
    
    var body: some View {
        
        Button() {
            
        } label: {
            NavigationLink(destination:    privacyView) {
                
                HStack {
                    Image(systemName: "exclamationmark.square")
                    Text("privacy policy")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 5.0).stroke(Color.accentColor, lineWidth: 2)
                }
                .background(Color.yellowButton)
            }
        }
        .foregroundColor(Color.accentColor)
    }
}

#Preview {
    PrivacyPolicyButtonView()
}
