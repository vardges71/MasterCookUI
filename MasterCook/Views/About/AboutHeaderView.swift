//
//  AboutHeaderView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-19.
//

import SwiftUI

struct AboutHeaderView: View {
    
    let appVersionString: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    let buildNumber: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    
    var currentYear = Date.now.formatted(.dateTime.year())
    
    var body: some View {
        VStack(spacing: 0) {
            
            ZStack {
                VStack(spacing: 0) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("My MasterCook")
                                .underline()
                                .fontWeight(.medium)
                                .font(.title2)
                                .foregroundStyle(Color.accentColor)
                            Text("Version \(appVersionString) (#\(buildNumber))")
                                .foregroundStyle(Color.accentColor)
                                .font(.headline)
                                .offset(y: 5)
                            
                            Text("© \(currentYear) Vardges Gasparyan.\nAll Rights Reserved")
                                .foregroundStyle(Color.accentColor)
                                .offset(y:10)
                                .font(.footnote)
                        }
                    Spacer()
                    } .padding(20)
                }
            } .background(Color.yellowButton)
        }
        .offset(y: 1)
    }
}

#Preview {
    AboutHeaderView()
}
