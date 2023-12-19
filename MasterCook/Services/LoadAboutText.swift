//
//  LoadAboutText.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-19.
//

import Foundation

class LoadAboutText {

    func loadAboutText(file name:String) -> String {
        
        if let path = Bundle.main.path(forResource: name, ofType: "txt") {

            if let contents = try? String(contentsOfFile: path) {

                return contents

            } else {

                print("Error! - This file doesn't contain any text.")
            }

        } else {

            print("Error! - This file doesn't exist.")
        }

        return ""
    }
}
