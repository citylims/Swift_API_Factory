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
    let picture: String
    let email: String
    let phoneNumber: String
    let rating: Int
    
    func build() -> User {
        return User(firstName: firstName, lastName: lastName, picture: picture, email: email, phoneNumber: phoneNumber, rating: rating)
    }
}