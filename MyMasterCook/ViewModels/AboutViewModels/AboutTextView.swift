//
//  AboutTextView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-23.
//

import SwiftUI

struct AboutTextView: View {
    var body: some View {
        
        ScrollView {
            Text( LoadAboutText().loadAboutText(file: "About_MyMasterCook") )
                .font(.footnote)
        } .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .foregroundColor(Colors.textColor)
            .background(Colors.alertBackgroundColor)
    }
}

struct AboutTextView_Previews: PreviewProvider {
    static var previews: some View {
        AboutTextView()
    }
}
