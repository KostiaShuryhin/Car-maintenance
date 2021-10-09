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

//    var logicKeySega: Bool = false
    var picekerData: String = ""
    var user: User!
    var ref: DatabaseReference!
    var userCars = [UserCar]()

    @IBOutlet weak var pickerVeiw: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        navigationController?.isNavigationBarHidden = true


//        if logicKeySega {
//            performSegue(withIdentifier: Constants.Segues.settingsCarIsEmpty, sender: nil)
//        }
        
        pickerVeiw.dataSource = self
        pickerVeiw.delegate = self

        self.user = FirebaseService.getCurrentUser()

        ref = Database.database().reference(withPath: Constants.FireBase.users).child(String(user.uid)).child(Constants.FireBase.userCars)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
  
            // MARK: - првоерить нижнию навигацию!! проблема
//        с is inition. может сделать проверку и перетянуть его через код? или через навигатион контроллер
        
        
        if FirebaseService.checkCarArray(currentUser: user) == false {
            navigationController?.popViewController(animated: true)
        } else {
                return userCars = FirebaseService.getUserCarArray(currentUser: user)}
        }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        let componentsInPicerView: Int = 1
        return componentsInPicerView
    }

    // MARK: - обязательно поправь пикер

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return userCars.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        picekerData = "\(String(describing: userCars[row].maker)) \(userCars[row].model ?? "plese add maker and model")"
        return picekerData
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        ref?.removeAllObservers()
    }
}


extension ChooseCarVC: ChooseCarVCProtocol, UIPickerViewDataSource, UIPickerViewDelegate {

}
