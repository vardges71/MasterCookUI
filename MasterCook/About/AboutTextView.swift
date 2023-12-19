//
//  AboutTextView.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-19.
//

import SwiftUI

struct AboutTextView: View {
    
    var body: some View {
        
        ScrollView {
            Text( LoadAboutText().loadAboutText(file: "About_MyMasterCook") )
                .font(.footnote)
        } .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .foregroundStyle(Color.accentColor)
            .background(Color.yellowButton)
    }
}

#Preview {
    AboutTextView()
}
