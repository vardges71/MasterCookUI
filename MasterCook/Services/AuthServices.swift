//
//  AuthServices.swift
//  MasterCook
//
//  Created by Vardges Gasparyan on 2023-12-14.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase
import FirebaseDatabaseSwift

enum AuthStates {
    
    case undefined
    case authorised
    case notAuthorised
}

class AuthServices: ObservableObject {
    
    @Published var authState: AuthStates = .undefined
    @Published var uid: String = ""
    
    var userAuth = false
    
    init() {
        
        setupAuthListener()
    }
    
    func setupAuthListener() {
        
        Auth.auth().addStateDidChangeListener { _, user in
            
            self.authState = user == nil ? .notAuthorised : .authorised
            guard let user = user else { return }
            self.uid = user.uid
        }
    }
    
    func signUp(_ email: String, password: String) async throws {
        
        try await Auth.auth().createUser(withEmail: email, password: password)
        guard uid != "" else { return }
        try createProfile(email: email)
    }
    
    func createProfile(email: String) throws {
        
        let reference: DatabaseReference!
        reference = Database.database().reference(withPath: "users").child(uid).child("credentials")
        reference.setValue(["email" : email])
    }
    
    func login(email: String, password: String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func logout() throws {
        try Auth.auth().signOut()
    }
    
    func deleteAccount() {
        
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
    
    func forgotPassword(email: String) async throws {
        
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
}
