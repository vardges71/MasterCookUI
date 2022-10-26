//
//  User.swift
//  MyMasterCook
//
//  Created by Vardges Gasparyan on 2022-10-24.
//

import Foundation

class User: ObservableObject {
    
    @Published var id: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
}
