//
//  Recipes.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-27.
//

import Foundation

class Recipe: ObservableObject {

    @Published var id: String = ""
    @Published var name: String = ""
    @Published var thumbnail_url: String = ""
    @Published var video_url: String = ""
    @Published var instructions: String = ""
    @Published var num_servings: Int? = 0

    @Published var fiber: Int?
    @Published var protein: Int?
    @Published var fat: Int?
    @Published var calories: Int?
    @Published var sugar: Int?
    @Published var carbohydrates: Int?

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
