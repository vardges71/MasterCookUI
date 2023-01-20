//
//  ToolBarPrintButton.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-12-25.
//

import SwiftUI

struct ToolBarPrintButton: View {
    var body: some View {
        Button {
            print("Print Button")
        } label: {
            VStack {
                Image(systemName: "printer")
                Text("print")
                    .font(.caption)
            }
            .foregroundColor(Colors.textColor)
        }
    }
}

struct ToolBarPrintButton_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarPrintButton()
    }
}
