//
//  AboutHeaderView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-23.
//

import SwiftUI

struct AboutHeaderView: View {
    
    let appVersionString: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    let buildNumber: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            ZStack {
                VStack(spacing: 0) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("My MasterCook")
                                .underline()
                                .fontWeight(.medium)
                                .font(.title2)
                                .foregroundColor(Colors.textColor)
                            Text("Version \(appVersionString) (#\(buildNumber))")
                                .foregroundColor(Colors.textColor)
                                .font(.headline)
                                .offset(y: 5)
                            
                            Text("© 2022 Vardges Gasparyan. All Rights Reserved")
                                .foregroundColor(Colors.textColor)
                                .offset(y:10)
                                .font(.footnote)
                        }
                    Spacer()
                    } .padding(20)
                }
            } .background(Colors.alertBackgroundColor)
        }
        .offset(y: 1)
    }
}

struct AboutHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AboutHeaderView()
    }
}
