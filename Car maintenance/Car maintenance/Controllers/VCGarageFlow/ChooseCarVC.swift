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
    var user: User!
    var ref: DatabaseReference!
    var userCars = [UserCar]()

    @IBOutlet weak var pickerView: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true

        pickerView.dataSource = self
        pickerView.delegate = self

        self.user = FirebaseService.getCurrentUser()

        ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("userCar")

        if logicKeySega == true {
            performSegue(withIdentifier: "IdSettingsCarTVC", sender: nil)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        if FirebaseService.checkCarArray(currentUser: user) == false {
            guard let addCarVC = storyboard?.instantiateViewController(identifier: "AddCarVC")
            else {
                return userCars = FirebaseService.getUserCarArray(currentUser: user)}

            // может вызвать утечку памяти в замыкании



            // MARK: - может не работать без приведения к UIViewController

            navigationController?.pushViewController(addCarVC, animated: false)

        }


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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ref.removeAllObservers()
    }
}

extension ChooseCarVC: ChooseCarVCProtocol, UIPickerViewDataSource, UIPickerViewDelegate {

}
