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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let currentUser = Auth.auth().currentUser
//              let user = currentUser as? User
              else {return}
        
        if FirebaseService.getUserCarArray(currentUser: currentUser).isEmpty == false {
            performSegue(withIdentifier: "IdChooseCarVC", sender: nil)
        }
        
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
////        self.tabBarController?.navigationItem.hidesBackButton = true
//        self.tabBarController?.navigationItem.backButtonTitle = "SignOUT"
//    }
    
    func SingOUT() {
    }
    
    @IBAction func addCarBotton(_ sender: Any) {
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let destVC = segue.destination as? ChooseCarVC else { return }
            destVC.logicKeySega = true
        }
    }
    
   
    
    
}
