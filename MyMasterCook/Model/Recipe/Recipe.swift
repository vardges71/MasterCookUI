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

//    init(id: String, name: String, thumbnail_url: String, video_url: String, instructions: String, num_servings: Int? = nil, fiber: Int? = nil, protein: Int? = nil, fat: Int? = nil, calories: Int? = nil, sugar: Int? = nil, carbohydrates: Int? = nil) {
//        self.id = id
//        self.name = name
//        self.thumbnail_url = thumbnail_url
//        self.video_url = video_url
//        self.instructions = instructions
//        self.num_servings = num_servings
//        self.fiber = fiber
//        self.protein = protein
//        self.fat = fat
//        self.calories = calories
//        self.sugar = sugar
//        self.carbohydrates = carbohydrates
//    }
}
