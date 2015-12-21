//
//  User.swift
//  apiFactory
//
//  Created by Austin Formica on 12/20/15.
//  Copyright © 2015 citylims. All rights reserved.
//

import Foundation

struct User {
    let firstName: String
    let lastName: String
    let phoneNumber: Int
    let picture: String
    let email: String
    let rating: Int
    
    
    func currentUser() -> User {
        return User(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, picture: picture, email: email, rating: rating)
    }
}