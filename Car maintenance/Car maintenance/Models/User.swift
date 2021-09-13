//
//  User.swift
//  Car maintenance
//
//  Created by Константин on 13.09.21.
//

import Foundation
import Firebase

struct User {
    
    init(user: Firebase.User) {
        self.uid = user.uid
        self.email = user.email ?? ""
    }
    
    let uid: String
    let email: String
    
}
