//
//  Utility.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-26.
//

import SwiftUI
import Foundation
import FirebaseAuth
import FirebaseDatabase
import Firebase

class Utilities {
    
    //  MARK: - PROPERTIES
    
    @ObservedObject var user: User = User()
    
    //  MARK: - Password Validate
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let pwdRegEx = "(?:(?:(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_])|(?:(?=.*?[0-9])|(?=.*?[A-Z])|(?=.*?[-!@#$%&*ˆ+=_])))|(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_]))[A-Za-z0-9-!@#$%&*ˆ+=_]{6,15}"
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", pwdRegEx)
        
        return passwordTest.evaluate(with: password)
    }
    
    //  MARK: - Validate Fields
    
    /*
     static func validateFields() -> String? {
     
     // Check that all fields are filled in
     if user.email.trimmingCharacters(in: .whitespacesAndNewlines) == "" || password.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
     
     return "please fill in all fields"
     }
     
     // Check that password field equals rePassword text fild
     if password != re_password {
     
     return "please enter the same passwords in the passwors and rePassword fields"
     }
     
     // Check if the password is secure
     let cleanedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
     
     if Utilities.isPasswordValid(cleanedPassword) == false {
     
     // Password isn't secure enogh
     return "Please make sure your password is at least 8 characters, contains a special character and number"
     }
     
     return nil
     }
     */
    
    //  MARK: - Regidster User
    
    
    static func registerUser() {
        
        // Validate the fields
//        let error = validateFields()
        
//        if error != nil {
            
            // There's something wrong with the fields, show error message
//            showError(error!)
//        } else {
            
            // Create cleaned version of the data
//            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the User
//            Auth.auth().createUser(withEmail: user.email, password: password) { (result, err) in
                
//                if err != nil {
                    
                    // There was an error creating the user
//                    self.showError("Error creatimg the user")
//                } else {
                    
                    // User was created successfully, now store the first name and the last name
//                    let db: DatabaseReference!
//                    db = Database.database().reference(withPath: "users").child(result!.user.uid).child("credentials")
                    
//                    db.setValue(["email" : user.email]) { (result, err) in
                        
//                        if err != nil {
                            
                            //Show erroe message
//                            self.showError("Error saving user data")
//                        }
//                    }
//                }
//            }
//        }
    }
    
    
    //  MARK: - Log Out
    
    static func logOut() {
        
        let firebaseAuth = Auth.auth()
        
        do {
            
            try firebaseAuth.signOut()
            print ("User loged out")
            
        } catch let signOutError as NSError {
            
            print ("Error signing out: %@", signOutError)
        }
    }
    
    //  MARK: - Delete Account
    
    static func deleteAccount() {
        
        let user = Auth.auth().currentUser
        let ref = Database.database().reference().child("users").child(user!.uid)
        
        ref.removeValue { error, _ in
            print(error as Any)
        }
        
        user?.delete { error in
            if let error = error {
                // An error happened.
                print("ERROR!!! - \(error)")
            } else {
                // Account deleted.
                print("USER DELETED")
            }
        }
    }
    
    //  MARK: - Optional Int in Text
    
    static func optionalIntView(_ property: Int?) -> Text {
        
        if let unwrappedProperty = property {
            
            return Text("serving \(unwrappedProperty == 0 ? "n/a" : "\(unwrappedProperty)") peoples")
                .foregroundColor(Colors.textColor)
                .font(.system(size: 13))
                .fontWeight(.bold)
            
        } else {
            return Text("n/a")
        }
    }
    
    static func optionalDoubleView(_ property: Int?) -> Text {
        
        if let unwrappedProperty = property {
            
            return Text("\(unwrappedProperty)")
            
        } else {
            return Text("n/a")
        }
    }
}
