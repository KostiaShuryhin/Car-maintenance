//
//  ChooseCarVC.swift
//  Car maintenance
//
//  Created by Константин on 17.09.21.
//

import UIKit

// MARK: - этот протокол ChooseCarVCProtocol для описаня и закрытия класса

protocol ChooseCarVCProtocol {
    var picekerData: String { get }

}

class ChooseCarVC: UIViewController {

    var picekerData: String = ""


    @IBOutlet weak var pickerView: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self

    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
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
