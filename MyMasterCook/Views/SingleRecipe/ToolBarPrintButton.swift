//
//  ToolBarPrintButton.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-12-25.
//

import SwiftUI
import UIKit

struct ToolBarPrintButton: View {
    
//    MARK: - PROPERTIES
    
    let recipe: Recipe
    
//    MARK: - BODY
    var body: some View {
        
        Button {
            
            printInstruction(text: "\(recipe.name)\n\nDESCRIPTION:\n\(recipe.description)\n\nINSTRUCTION:\n\(recipe.instructions)")
            
        } label: {
            VStack {
                Image(systemName: "printer")
                Text("print")
                    .font(.caption)
            }
            .foregroundColor(Colors.textColor)
        }
    }
    
    private func printInstruction(text: String) {
        
        let textWithNewCarriageReturns = text.replacingOccurrences(of: "\n", with: "<br />")
        let printController = UIPrintInteractionController.shared
        
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.outputType = UIPrintInfo.OutputType.general
        printController.printInfo = printInfo
        
        let format = UIMarkupTextPrintFormatter(markupText: textWithNewCarriageReturns)
        
        format.perPageContentInsets.top = 30
        format.perPageContentInsets.bottom = 72
        format.perPageContentInsets.left = 50
        format.perPageContentInsets.right = 30
        printController.printFormatter = format
        
        printController.present(animated: true, completionHandler: nil)
    }
}

//  MARK: - PREVIEW
struct ToolBarPrintButton_Previews: PreviewProvider {
    static var previews: some View {
        let recipes: [Recipe] = [Recipe]()
        ToolBarPrintButton(recipe: recipes[0])
    }
}
