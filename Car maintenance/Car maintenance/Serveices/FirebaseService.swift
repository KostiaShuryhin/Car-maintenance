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
    
    
    
//    static func getCurrentUser () -> () {
//        guard let currentUser = Auth.auth().currentUser else { return }
//        let user = User(user: currentUser)
//        guard self.user = user else {
//            return
//        }
//    }

    static func getUserCarArray(currentUser: Firebase.User) -> [UserCar] {
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

