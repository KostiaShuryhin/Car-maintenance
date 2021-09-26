//
//  AddCarVC.swift
//  Car maintenance
//
//  Created by Константин on 17.09.21.
//

import UIKit
import Firebase

//protocol AddCarProtocol {
//    func SingOUT () -> ()
//}
//
//extension AddCarVC: AddCarProtocol {
//}

class AddCarVC: UIViewController{

    var ref: DatabaseReference!
    var user: User!
    var userCar = [UserCar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.user = FirebaseService.getCurrentUser()
        if FirebaseService.checkCarArray(currentUser: user) == true {
            self.userCar = FirebaseService.getUserCarArray(currentUser: user)}
        
        if userCar.isEmpty == false {
            performSegue(withIdentifier: "IdChooseCarVC", sender: nil)
        }
    }

    func SingOUT() {
    }
    
    @IBAction func addCarBotton(_ sender: Any) {
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let destVC = segue.destination as? ChooseCarVC else { return }
            destVC.logicKeySega = true
        }
    }
    
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ref.removeAllObservers()
    }
    
}
