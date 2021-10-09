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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return ConstGarageFlow.AmountSection.descriptionTVC
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        var rowsInSection: Int = 0

        if section == 0 {
            rowsInSection = ConstGarageFlow.CarNameCellDataRow.allCases.count
            if section == 1 {
                rowsInSection = ConstGarageFlow.SettingsCarCellDataRow.allCases.count
                if section == 2 {
                    rowsInSection = ConstGarageFlow.ButtonCellAmount.oneCell }
            } else { return 0 }
        }
        return rowsInSection
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//        let section = self.tableView.numberOfSections
        let section = indexPath.section
        var cell: UITableViewCell!

        switch section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cellCarName", for: indexPath) as? CellCarNameTVC {
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
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cellWith2Lbl", for: indexPath) as? CellCarSettingsTVC {
                cell.titleLbl.text = EnumArraySercice.arraySettingsCarCellDataRow[indexPath.row]
                cell.parametrLbl.text = "" }

        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cellButtons", for: indexPath) as? CellButtonTVC {
            }
        }
        return cell
    }
}

