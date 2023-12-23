//
//  Recipe.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-20.
//

import SwiftUI

class Recipe: ObservableObject {
    
    @Published var ingredient: String = ""
    
    @Published var id: String = ""
    @Published var name: String = ""
    @Published var thumbnail_url: String = ""
    @Published var video_url: String = ""
    @Published var instructions: String = ""
    @Published var description: String = ""
    @Published var num_servings: Int?

    @Published var fiber: Int?
    @Published var protein: Int?
    @Published var fat: Int?
    @Published var calories: Int?
    @Published var sugar: Int?
    @Published var carbohydrates: Int?

//    init(id: String, name: String, thumbnail_url: String, video_url: String, instructions: String, description: String, num_servings: Int? = nil, fiber: Int? = nil, protein: Int? = nil, fat: Int? = nil, calories: Int? = nil, sugar: Int? = nil, carbohydrates: Int? = nil) {
//        self.id = id
//        self.name = name
//        self.thumbnail_url = thumbnail_url
//        self.video_url = video_url
//        self.instructions = instructions
//        self.description = description
//        self.num_servings = num_servings
//        self.fiber = fiber
//        self.protein = protein
//        self.fat = fat
//        self.calories = calories
//        self.sugar = sugar
//        self.carbohydrates = carbohydrates
//    }
}
