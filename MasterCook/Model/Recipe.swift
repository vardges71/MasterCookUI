//
//  Recipe.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-20.
//

import SwiftUI

class Recipe: ObservableObject, Identifiable {
    
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
}
