//
//  WebServices.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-19.
//

import SwiftUI
import FirebaseDatabase
import FirebaseAuth

@MainActor
class WebServices: ObservableObject {
    
    @Published var ingredients: [String] = []
    @Published var recipeArray: [Recipe] = []
    @Published var favoriteArray: [Recipe] = []
    
    @Published var recipeDataEmpty = false
    @Published var favoriteDataEmpty: Bool = false
    
    var ref: DatabaseReference!
    
    let s = 150
    
    func fetchRecipes() async throws {
        
        let allowedCharacterSet = CharacterSet.urlQueryAllowed
        
        let ing = ingredients.joined(separator: ",")
        let replasedIngredient = ing.replacingOccurrences(of: ",", with: "%2C")
        let ingredientsForURL = replasedIngredient.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)
        
        print(ingredientsForURL ?? "")
        
        let headers = [
            "x-rapidapi-key": "e25b9b1e84msh0478f04ed91563dp15ca17jsn90ddd01db01f",
            "x-rapidapi-host": "tasty.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=\(s)&q=\(ingredientsForURL ?? "")")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if (error != nil) {
                print(error?.localizedDescription as Any)
            } else {
                
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse?.statusCode as Any)
                
                do {
                    
                    let dict = try JSONSerialization.jsonObject(with: data!) as! [String:AnyObject]
                    
                    if let results = dict["results"] as? Array<Dictionary<String, Any>> {
                
                        print("RECIPE COUNT \(results.count)")
                        
                        DispatchQueue.main.async {
                            
                            if results.count == 0 {
                                self.recipeDataEmpty = true
                                
                            }
                        }
                        
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
                            if let description = result["description"] as? String {
                                oneRecipe.description = description
                            }
                            if let nutritions = result["nutrition"] as? Dictionary<String, Any> {
                                
                                for (key, value) in nutritions {
                                    
                                    if key == "fiber" {
                                        oneRecipe.fiber = (value as? Int)
                                    }
                                    if key == "protein" {
                                        oneRecipe.protein = (value as? Int)
                                    }
                                    if key == "fat" {
                                        oneRecipe.fat = (value as? Int)
                                    }
                                    if key == "calories" {
                                        oneRecipe.calories = (value as? Int)
                                    }
                                    if key == "sugar" {
                                        oneRecipe.sugar = (value as? Int)
                                    }
                                    if key == "carbohydrates" {
                                        oneRecipe.carbohydrates = (value as? Int)
                                    }
                                }
                            }
                            
                            DispatchQueue.main.async {
                                self.recipeArray.append(oneRecipe)
                                print("You fetch \(self.recipeArray.count) recipes from web services")
                            }
                        }
                    }
                }
                catch {
                    print("Catch ERROR: \(error)")
                }
            }
        })
        dataTask.resume()
        
        ingredients.removeAll()
    }
    
    func getFavoriteRecipes() async throws {
        
        if Auth.auth().currentUser != nil {
            let userID = Auth.auth().currentUser!.uid
            ref = Database.database().reference()
            
            do {
                
                ref.child("users").child(userID).child("favorites").observe(.childAdded) { (snapshot) in
                    
                    guard let snapChildren = snapshot.value as? [String: Any] else { return }
                    
                    let favRecipe = Recipe()
                    
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
                    
                    DispatchQueue.main.async {
                        
                        self.favoriteArray.append(favRecipe)
                        
                        if self.favoriteArray.count == 0 {
                            self.favoriteDataEmpty = true
                        }
                    }
                }
            }
        }
    }
    
    func checkFavDataEmpty() {
        
        favoriteDataEmpty = false
        
        if favoriteArray.count == 0 {
            
            Task {
                do {
                    
                    try await getFavoriteRecipes()
                    print("You fetch \(favoriteArray.count) recipes")
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func checkRecipeDataEmpty() {

        recipeDataEmpty = false
        
        if recipeArray.count == 0 {
            Task {
                do {
                    
                    try await fetchRecipes()
                    print("You fetch \(recipeArray.count) recipes")
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
