//
//  Recipes.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-27.
//

import SwiftUI

struct Recipe: Identifiable {

    var id: String
    var name: String
    var thumbnail_url: String
    var video_url: String
    var instructions: String
    var description: String
    var num_servings: Int?

    var fiber: Int?
    var protein: Int?
    var fat: Int?
    var calories: Int?
    var sugar: Int?
    var carbohydrates: Int?

}
