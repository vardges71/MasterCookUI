//
//  FetchJSON.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-27.
//

import Foundation

class WebService: ObservableObject {
    
    var ingredientsFromSearch = UserDefaults.standard.object(forKey: "ingForUrl") ?? ""
    
    public var ingredientArray: [String] = []
    public var searchVM = SearchViewModel()
    public var ingredient = Ingredient()
    
    var id: String = ""
    var name: String = ""
    var thumbnail_url: String = ""
    var video_url: String = ""
    var instructions: String = ""
    var num_servings: Int? = nil
    var fiber: Int? = nil
    var protein: Int? = nil
    var fat: Int? = nil
    var calories: Int? = nil
    var sugar: Int? = nil
    var carbohydrates: Int? = nil
    
    let s = 150
    
    public var pub_recipe: [Recipe] = [Recipe]()
    
    func parseJSON(recipeListVM: RecipeListViewModel) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            print("parseJSON Caled\n\nIngredients: \(self.ingredientArray)\n")
        }
        
        let url = Bundle.main.url(forResource: "testing", withExtension: "json")!

        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                let jsonData = try Data(contentsOf: url)
                let dict = try JSONSerialization.jsonObject(with: jsonData) as! [String:AnyObject]

                if let results = dict["results"] as? Array<Dictionary<String, Any>> {

                    for result in results {

                        let oneRecipe = Recipe()

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

                        self.pub_recipe.append(oneRecipe)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                        
                        let delegateRecipes: UploadRecipesDelegate? = recipeListVM
                        delegateRecipes?.uploadRecipes(self.pub_recipe)
//                        print("RECIPE COUNT: \(self.pub_recipe.count)\n")
                    })
                }
            }
            catch {
                print("Catch ERROR: \(error)")
            }
        } .resume()
    }
}
