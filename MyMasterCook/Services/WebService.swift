//
//  FetchJSON.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-27.
//

import SwiftUI

public var ingredientArray: [String] = []

let s = 150

var recipeData: [Recipe] = [Recipe]()

func parseJSON() -> [Recipe] {
    
    if recipeData.isEmpty {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            print("parseJSON Caled\n\nIngredients: \(ingredientArray)\n")
        }
        
        let url = Bundle.main.url(forResource: "testing", withExtension: "json")!
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                let jsonData = try Data(contentsOf: url)
                let dict = try JSONSerialization.jsonObject(with: jsonData) as! [String:AnyObject]
                
                if let results = dict["results"] as? Array<Dictionary<String, Any>> {
                    
                    for result in results {
                        
                        var oneRecipe = Recipe(id: "",
                                               name: "",
                                               thumbnail_url: "",
                                               video_url: "",
                                               instructions: "",
                                               description: "",
                                               num_servings: 0,
                                               fiber: nil,
                                               protein: nil,
                                               fat: nil,
                                               calories: nil,
                                               sugar: nil,
                                               carbohydrates: nil)
                        
                        if let recipeId = result["id"] as? Int {
                            oneRecipe.id = String(recipeId)
                        }
                        if let recipeName = result["name"] as? String {
                            oneRecipe.name = recipeName
                        }
                        if let recipeImageUrl = result["thumbnail_url"] as? String {
                            oneRecipe.thumbnail_url = recipeImageUrl
                        }
                        if let recipeVideoUrl = result["video_url"] as? String {
                            oneRecipe.video_url = recipeVideoUrl
                        }
                        if let recipeNumServings = result["num_servings"] as? Int {
                            oneRecipe.num_servings = recipeNumServings
                        }
                        else {
                            oneRecipe.num_servings = 0
                        }
                        if let instructions = result["instructions"] as? Array<Dictionary<String, Any>> {
                            
                            for oneInstruction in instructions {
                                
                                if let oneParagraph = oneInstruction["display_text"] as? String {
                                    
                                    oneRecipe.instructions.append(oneParagraph)
                                    oneRecipe.instructions.append("\n\n")
                                }
                            }
                        }
                        if let description = result["description"] as? String {
                            oneRecipe.description = description
                        }
                        if let nutritions = result["nutrition"] as? Dictionary<String, Any> {
                            
                            for (key, value) in nutritions {
                                
                                if key == "fiber" {
                                    oneRecipe.fiber = (value as! Int)
                                }
                                if key == "protein" {
                                    oneRecipe.protein = (value as! Int)
                                }
                                if key == "fat" {
                                    oneRecipe.fat = (value as! Int)
                                }
                                if key == "calories" {
                                    oneRecipe.calories = (value as! Int)
                                }
                                if key == "sugar" {
                                    oneRecipe.sugar = (value as! Int)
                                }
                                if key == "carbohydrates" {
                                    oneRecipe.carbohydrates = (value as! Int)
                                }
                            }
                        }
                        
                        recipeData.append(oneRecipe)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                        
                        print("RECIPE COUNT: \(recipeData.count)\n\(recipeData.map(\.name))\n\(recipeData.map({$0.num_servings}))")
                    })
                }
            }
            catch {
                print("Catch ERROR: \(error)")
            }
        } .resume()
    } else {
        print("Recipe array after start \(recipeData.count)")
    }
    return recipeData
}
