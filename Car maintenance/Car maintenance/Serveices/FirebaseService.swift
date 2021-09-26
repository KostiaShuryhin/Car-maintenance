//
//  FirabaseService.swift
//  Car maintenance
//
//  Created by Константин on 21.09.21.
//

import Foundation
import Firebase

var ref: DatabaseReference!

class FirebaseService {

    static func getCurrentUser () -> (User) {
        var user: User!
        if let currentUser = Auth.auth().currentUser {
            user = User(user: currentUser) }
        return user
    }

    static func checkCarArray(currentUser: User) -> Bool {
        var booleValu: Bool = false

        ref.child("users/\(currentUser.uid)/userCar").getData { _, DataSnapshot in

            if DataSnapshot.exists() {
                booleValu = true
            }
        }
        return booleValu
    }
//    static func checkCarArray () -> Bool {
//        var booleValu: Bool!
//
//        ref.observe(.value) { snapshot in
//// сдесь может крыться ошибка может нужно weak self в замыкание
//            booleValu = snapshot.hasChild("userCar")}
//        return booleValu
//    }

    static func getUserCarArray(currentUser: User) -> [UserCar] {
        var userCars = [UserCar]()
        ref.observe(.value) { snapshot in
// сдесь может крыться ошибка может нужно weak self в замыкание
            for item in snapshot.children {
                guard let snapshot = item as? DataSnapshot,
                    let userCar = UserCar(snapshot: snapshot) else { continue }
                userCars.append(userCar)
            }
        }
        return userCars
    }

    static func signOutTapped () {
        do {
            // выходим из Auth.auth()
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

