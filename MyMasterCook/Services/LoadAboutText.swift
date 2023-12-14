//
//  LoadAboutText.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-23.
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

