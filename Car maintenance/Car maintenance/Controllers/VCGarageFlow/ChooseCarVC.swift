//
//  ChooseCarVC.swift
//  Car maintenance
//
//  Created by Константин on 17.09.21.
//

import UIKit
import Firebase

// MARK: - этот протокол ChooseCarVCProtocol для описаня и закрытия класса

protocol ChooseCarVCProtocol {
    var picekerData: String { get }

}

class ChooseCarVC: UIViewController {

    var logicKeySega: Bool = false
    var picekerData: String = ""
    var user: User! = nil
    var ref: DatabaseReference!
    var userCars = [UserCar]()

    @IBOutlet weak var pickerView: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.dataSource = self
        pickerView.delegate = self

        guard let currentUser = Auth.auth().currentUser else { return }
        let user = User(user: currentUser)
        self.user = user
        ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("userCar")
        
        if logicKeySega == true {
            performSegue(withIdentifier: "IdSettingsCarTVC", sender: nil)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
//        ref.observe(.value) { [weak self] snapshot in
//            var userCars = [UserCar]()
//            for item in snapshot.children {
//                guard let snapshot = item as? DataSnapshot,
//                    let userCar = UserCar(snapshot: snapshot) else { continue }
//                userCars.append(userCar)
//            }
        
        // может вызвать утечку памяти в замыкании
        guard let user = user
              else {
            return
        }
        userCars = FirebaseService.getUserCarArray(currentUser: user)
        

    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        let componentsInPicerView: Int = 1
        return componentsInPicerView
    }

    // MARK: - обязательно поправь пикер

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ""
    }

}

extension ChooseCarVC: ChooseCarVCProtocol, UIPickerViewDataSource, UIPickerViewDelegate {

}
