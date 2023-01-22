//
//  FetchJSON.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-27.
//

import SwiftUI
import Foundation
import FirebaseAuth
import FirebaseDatabase

class WebService {
    //  MARK: - PROPERTIES
    
    var ref: DatabaseReference!
    
    let s = 150
    
    var recipeData: [Recipe] = []
    var favoriteRecipeData: [Recipe] = []
    
    //var ingredientsForURL = "eggs"
    
    var ingredients = UserDefaults.standard.string(forKey: "urlIngredient") ?? ""
    
    
    //  MARK: - FUNCTIONS
    
    func parseJSON(recipeListVM: RecipeListViewModel) -> [Recipe] {
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            print("parseJSON Caled\n\nIngredients: \(self.ingredients)\n")
        }
        
        let headers = [
            "x-rapidapi-key": "e25b9b1e84msh0478f04ed91563dp15ca17jsn90ddd01db01f",
            "x-rapidapi-host": "tasty.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=\(s)&q=\(ingredients)")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        print("REQUEST: \(request)")
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let url = Bundle.main.url(forResource: "testing", withExtension: "json")!
        
        let session = URLSession.shared
        
        session.dataTask(with: url, completionHandler: {(data, response, error) -> Void in
            
            if (error != nil) {
                
                print(error!)
            } else {
                
                do {
                    
                    let dict = try JSONSerialization.jsonObject(with: data!) as! [String:AnyObject]
                    
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
                            
                            self.recipeData.append(oneRecipe)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                            
                            let delegateRecipes: UploadRecipesDelegate? = recipeListVM
                            delegateRecipes?.uploadRecipes(self.recipeData)
                            print("RECIPE COUNT: \(self.recipeData.count)\n\(self.recipeData.map(\.name))\n\(self.recipeData.map({$0.num_servings}))")
                        })
                    }
                }
                catch {
                    print("Catch ERROR: \(error)")
                }
            }
        }) .resume()
        
        return recipeData
    }
    
    func getFavoriteRecipes(favoriteListVM: FavoritesListViewModel) -> [Recipe] {
        
        if Auth.auth().currentUser != nil {
            
            let userID = Auth.auth().currentUser?.uid
            ref = Database.database().reference()
            
            ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                
                if (snapshot.hasChild("favorites")) {
                    
                } else {
                    
                    //            DispatchQueue.main.async { self.ifFavoritesIsEmptyAlert() }
                }
            })
            
            ref.child("users").child(userID!).child("favorites").observe(.childAdded) { (snapshot) in
                
                guard let snapChildren = snapshot.value as? [String: Any] else { return }
                
                var favRecipe = Recipe(id: "",
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
                
                for (key, value) in snapChildren {
                    
                    if key == "recipeID" {
                        
                        favRecipe.id = value as? String ?? " "
                    }
                    if key == "recipeName" {
                        
                        favRecipe.name = value as? String ?? " "
                    }
                    if key == "numServings" {
                        
                        favRecipe.num_servings = value as? Int ?? 0
                    }
                    if key == "recipeInstruction" {
                        
                        favRecipe.instructions = value as? String ?? " "
                    }
                    if key == "recipeDescription" {
                        
                        favRecipe.description = value as? String ?? " "
                    }
                    if key == "recipeThumbnailURL" {
                        
                        favRecipe.thumbnail_url = value as? String ?? " "
                    }
                    if key == "recipeVideoURL" {
                        
                        favRecipe.video_url = value as? String ?? " "
                    }
                    
                    if key == "recipeFiber" {
                        favRecipe.fiber = (value as! Int)
                    }
                    if key == "recipeProtein" {
                        favRecipe.protein = (value as! Int)
                    }
                    if key == "recipeFat" {
                        favRecipe.fat = (value as! Int)
                    }
                    if key == "recipeCalories" {
                        favRecipe.calories = (value as! Int)
                    }
                    if key == "recipeSugar" {
                        favRecipe.sugar = (value as! Int)
                    }
                    if key == "recipeCarbohydrates" {
                        favRecipe.carbohydrates = (value as! Int)
                    }
                }
                
                self.favoriteRecipeData.append(favRecipe)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                
                let delegateRecipes: UploadFavoriteDelegate? = favoriteListVM
                delegateRecipes?.uploadFavorites(self.favoriteRecipeData)
            })
        }
        return favoriteRecipeData
    }
}
