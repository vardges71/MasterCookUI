//
//  Recipes.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-27.
//

import Foundation

class Recipe {

    var id: String = ""
    var name: String = ""
    var thumbnail_url: String = ""
    var video_url: String = ""
    var instructions: String = ""
    var num_servings: Int? = 0

    var fiber: Double?
    var protein: Double?
    var fat: Double?
    var calories: Double?
    var sugar: Double?
    var carbohydrates: Double?

    init(id: String, name: String, thumbnail_url: String, video_url: String, instructions: String, num_servings: Int? = nil, fiber: Double? = nil, protein: Double? = nil, fat: Double? = nil, calories: Double? = nil, sugar: Double? = nil, carbohydrates: Double? = nil) {
        self.id = id
        self.name = name
        self.thumbnail_url = thumbnail_url
        self.video_url = video_url
        self.instructions = instructions
        self.num_servings = num_servings
        self.fiber = fiber
        self.protein = protein
        self.fat = fat
        self.calories = calories
        self.sugar = sugar
        self.carbohydrates = carbohydrates
    }
}

//struct Recipe: Codable {
//
//    var id: String
//    var name: String
//    var thumbnail_url: String
//    var video_url: String
//    var instructions: String
//    var num_servings: Int?
//
//    var fiber: Double?
//    var protein: Double?
//    var fat: Double?
//    var calories: Double?
//    var sugar: Double?
//    var carbohydrates: Double?
//}
