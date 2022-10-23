//
//  PrivacyView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-22.
//

import SwiftUI

struct PrivacyView: View {
    
    var backImageName = "backYellow"
    
    var body: some View {
        
        ZStack {
            fullBackground(imageName: backImageName)
            Text("PRIVACY POLICY")
        }
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
