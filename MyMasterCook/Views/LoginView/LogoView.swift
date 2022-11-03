//
//  LogoView.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-24.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6).fill(Color.clear)
            Image("LogoYellow_New")
                .resizable()
                .scaledToFit()
                .frame(width: 210)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
