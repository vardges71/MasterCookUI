//
//  ToolBarFavoriteButton.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-12-25.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct ToolBarFavoriteButton: View {
    //    MARK: - PROPERTIES
    
    let recipe: Recipe
    @State private var isDisabled: Bool = false
    @State private var isExist: Bool = false
    
    //    MARK: - BODY
    var body: some View {
        Button {
            isExist.toggle()
            print("Favorite Button")
        } label: {
            VStack {
                Image(systemName: isExist ? "star.fill" : "star")
                    .environment(\.symbolVariants, .none)
                Text("favorite")
                    .font(.caption)
            }
            .foregroundColor(Colors.textColor)
            .opacity(isDisabled ? 0.5 : 1)
        }
        .disabled(isDisabled)
        .onAppear {
            isUserExist()
            checkRecipeExist()
        }
    }
    
    //    MARK: - METHODES
    
    func isUserExist() {
        if Auth.auth().currentUser != nil {
            isDisabled = false
        } else {
            isDisabled = true
        }
    }
    
    func checkRecipeExist() {
        
        let userID = Auth.auth().currentUser?.uid
        let recipeID = recipe.id
        ref = Database.database().reference()
        
        if isDisabled == false {
            ref.child("users").child(userID!).child("favorites").observeSingleEvent(of: .value, with: { (snapshot) in
                
                if (snapshot.hasChild(recipeID)) {
                    isExist = true
                    print("FAVORITE EXIST")
                } else {
                    isExist = false
                    print("FAVORITE IS NOT EXIST")
                }
            })
        }
    }
    
    func addToFavorite() {
        
        // Create cleaned version of the data
        let recipeID = recipe.id
        let recipeName = recipe.name
        let recipeThumbnailUrl = recipe.thumbnail_url
        let recipeVideoURL = recipe.video_url
        let recipeInstruction = recipe.instructions
        let recipeDescription = recipe.description
        let numServings = recipe.num_servings ?? 0
        
        let recipeFiber = recipe.fiber
        let recipeProtein = recipe.protein
        let recipeFat = recipe.fat
        let recipeCalories = recipe.calories
        let recipeSugar = recipe.sugar
        let recipeCarbohydrates = recipe.carbohydrates
        
        
        let userID = Auth.auth().currentUser?.uid
        
        ref = Database.database().reference()
        
        ref.child("users").child(userID!).child("favorites").observeSingleEvent(of: .value, with: { (snapshot) in
            
            if (snapshot.hasChild(recipeID)) {
                
                // ALERT
                
            } else {
                
                ref = Database.database().reference(withPath: "users").child(userID!).child("favorites").child(recipeID)
                ref.setValue([
                    "recipeID": recipeID as Any,
                    "recipeName": recipeName as Any,
                    "recipeThumbnailURL": recipeThumbnailUrl as Any,
                    "recipeVideoURL": recipeVideoURL as Any,
                    "recipeInstruction": recipeInstruction as Any,
                    "recipeDescription": recipeDescription as Any,
                    "numServings": numServings as Any,
                    "recipeFiber": recipeFiber as Any,
                    "recipeProtein": recipeProtein as Any,
                    "recipeFat": recipeFat as Any,
                    "recipeCalories": recipeCalories as Any,
                    "recipeSugar": recipeSugar as Any,
                    "recipeCarbohydrates": recipeCarbohydrates as Any
                    
                ]) { (result, err) in
                    
                    if err != nil {
                        
                        //Show erroe message
                        print("Error saving user data \(String(describing: err))")
                    }
                }
            }
        })
    }
    
    func deleteFavorite() {
        
//        let recipeID = recipe.id
//
//        let alert = UIAlertController(title: "Remove from favorites", message: "Do you really want to remove recipe from your favorites?", preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { acion in
//
//            let user = Auth.auth().currentUser
//
//            self.ref = Database.database().reference()
//
//            self.ref.child("users").child(user!.uid).child("favorites").observeSingleEvent(of: .value, with: { (snapshot) in
//
//                if snapshot.hasChild(recipeID!){
//
//                    self.ref.child("users").child(user!.uid).child("favorites").child(recipeID!).removeValue()
//                }
//            })
//
//        }))
//        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
//
//        self.present(alert, animated: true)
    }
}

//  MARK: - PREVIEW
struct ToolBarFavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        let recipes: [Recipe] = [Recipe]()
        ToolBarFavoriteButton(recipe: recipes[0])
    }
}
