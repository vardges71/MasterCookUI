//
//  FetchJSON.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-27.
//

import Foundation

class WebService: ObservableObject {
    
    var ingredientsFromSearch = UserDefaults.standard.object(forKey: "ingForUrl") ?? ""
    
    var id: String = ""
    var name: String = ""
    var thumbnail_url: String = ""
    var video_url: String = ""
    var instructions: String = ""
    var num_servings: Int? = nil
    var fiber: Double? = nil
    var protein: Double? = nil
    var fat: Double? = nil
    var calories: Double? = nil
    var sugar: Double? = nil
    var carbohydrates: Double? = nil
    
    let s = 150
    
    @Published var pub_recipe: [Recipe] = []
    
    
    func parseJSON(recipeListViewModel: RecipeListViewModel) {

        let url = Bundle.main.url(forResource: "testing", withExtension: "json")!

        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                let jsonData = try Data(contentsOf: url)
                let dict = try JSONSerialization.jsonObject(with: jsonData) as! [String:AnyObject]

                if let results = dict["results"] as? Array<Dictionary<String, Any>> {

                    for result in results {

                        let oneRecipe = Recipe(id: self.id,
                                               name: self.name,
                                               thumbnail_url: self.thumbnail_url,
                                               video_url: self.video_url,
                                               instructions: self.instructions,
                                               num_servings: self.num_servings,
                                               fiber: self.fiber,
                                               protein: self.protein,
                                               fat: self.fat,
                                               calories: self.calories,
                                               sugar: self.sugar,
                                               carbohydrates: self.carbohydrates)


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
                        if let nutritions = result["nutrition"] as? Dictionary<String, Any> {

                            for (key, value) in nutritions {

                                if key == "fiber" {
                                    oneRecipe.fiber = (value as! Double)
                                }
                                if key == "protein" {
                                    oneRecipe.protein = (value as! Double)
                                }
                                if key == "fat" {
                                    oneRecipe.fat = (value as! Double)
                                }
                                if key == "calories" {
                                    oneRecipe.calories = (value as! Double)
                                }
                                if key == "sugar" {
                                    oneRecipe.sugar = (value as! Double)
                                }
                                if key == "carbohydrates" {
                                    oneRecipe.carbohydrates = (value as! Double)
                                }
                            }
                        }

                        DispatchQueue.main.async {
                            self.pub_recipe.append(oneRecipe)
                            print("\(oneRecipe.name)")
                        }
                    }
                    DispatchQueue.main.async {
                        let delegateRecipes: UploadRecipesDelegate? = recipeListViewModel
                        delegateRecipes?.uploadRecipes(self.pub_recipe)
                        print("RECIPE COUNT: \(self.pub_recipe.count)\n")
                    }
                }
            }
            catch {
                print("Catch ERROR: \(error)")
            }
        } .resume()
    }
}
