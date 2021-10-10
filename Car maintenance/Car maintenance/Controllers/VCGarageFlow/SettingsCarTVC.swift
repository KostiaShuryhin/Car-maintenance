//
//  SettingsCarTVC.swift
//  Car maintenance
//
//  Created by Константин on 17.09.21.
//

import UIKit
import Firebase

class SettingsCarTVC: UITableViewController {

    var user: User!
    var ref: DatabaseReference!
    var userCars = [UserCar]()
    var currentUserCar: UserCar? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let currentUser = Auth.auth().currentUser else { return }
        let user = User(user: currentUser)
        ref = Database.database().reference(withPath: Constants.FireBase.users).child(String(user.uid)).child(Constants.FireBase.userCars)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return ConstGarageFlow.AmountSection.settingsTVC
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        var rowsInSection: Int = 0

        switch section {
        case 0:
            rowsInSection = ConstGarageFlow.CarNameCellDataRow.allCases.count
            return rowsInSection
        case 1:
            rowsInSection = ConstGarageFlow.SettingsCarCellDataRow.allCases.count
            return rowsInSection
        default:
            rowsInSection = ConstGarageFlow.ButtonCellAmount.oneCell
            return rowsInSection
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//        let section = self.tableView.numberOfSections
        let section = indexPath.section
//
//        var cell: UITableViewCell!

        switch section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellCarName", for: indexPath) as! CellCarNameTVC
            cell.titleLbl.text = EnumArraySercice.arrayCarNameCellDataRow[indexPath.row]

            if currentUserCar != nil {
                if indexPath.row == 0 {
                    cell.itemLbl.text = currentUserCar?.maker
                } else {
                    cell.itemLbl.text = currentUserCar?.model
                }
            } else {
                cell.itemLbl.text = ""
            }
            return cell

        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellWith2Lbl", for: indexPath) as! CellCarSettingsTVC
            cell.titleLbl.text = EnumArraySercice.arraySettingsCarCellDataRow[indexPath.row]
            cell.parametrLbl.text = ""
            return cell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellButtons", for: indexPath) as! CellButtonTVC
            return cell
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segues.carModelOrManufacturer {
            if let carModelOrManufacturer = segue.destination as? CarModelOrManufacturerTVC {
                guard let destinationUrl = sender as? String else { return }
                
                carModelOrManufacturer.destinationUrl = destinationUrl
            }
        }
    }
}

extension SettingsCarTVC {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let destinationUrl: String = EnumArraySercice.arrayCarNameCellDataRow[indexPath.row]
            performSegue(withIdentifier: Constants.Segues.carModelOrManufacturer, sender: destinationUrl)
        }
    }
}
