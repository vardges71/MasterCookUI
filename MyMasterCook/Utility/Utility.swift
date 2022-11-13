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
    
    
// MARK: - Password Validate
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let pwdRegEx = "(?:(?:(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_])|(?:(?=.*?[0-9])|(?=.*?[A-Z])|(?=.*?[-!@#$%&*ˆ+=_])))|(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_]))[A-Za-z0-9-!@#$%&*ˆ+=_]{6,15}"
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", pwdRegEx)
        
        return passwordTest.evaluate(with: password)
    }
// MARK: - Log Out
    
    static func logOut() {
        
        let firebaseAuth = Auth.auth()

        do {

            try firebaseAuth.signOut()
            print ("User loged out")
            
        } catch let signOutError as NSError {

          print ("Error signing out: %@", signOutError)
        }
    }
    
// MARK: - Delete Account
    
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
// MARK: - Optional Int in Text
    
    static func optionalIntView(_ property: Int?) -> Text {
        
       if let unwrappedProperty = property {
           
           return Text("serving \(unwrappedProperty) peoples")
               .foregroundColor(Colors.textColor)
               .font(.system(size: 13))
               .fontWeight(.bold)
           
       } else {
           return Text("")
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
