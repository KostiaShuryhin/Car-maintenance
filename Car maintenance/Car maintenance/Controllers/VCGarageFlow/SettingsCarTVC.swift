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

        } else if section == 1 {
            rowsInSection = ConstGarageFlow.SettingsCarCellDataRow.allCases.count

        } else if section == 2 {
            rowsInSection = ConstGarageFlow.ButtonCellAmount.oneCell }

        return rowsInSection
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let section = self.tableView.numberOfSections
//        let section = indexPath.section
        var cell: UITableViewCell!

        if section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellCarName", for: indexPath) as! CellCarNameTVC
//
//            var dataArray = [String]()
//            let arrayEnumTipe = ConstGarageFlow.CarNameCellDataRow.allCases
//
//            for item in arrayEnumTipe {
//                let itemString = item.rawValue
//                dataArray.append(itemString)
            }

            return cell
        }
        return cell
    }

//        return cell
}

//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCarName", for: indexPath)
//
//
//        cell.textLabel?.text = objectArray[indexPath.section].sectionObjects[indexPath.row]
//        return cell


// MARK: - Navigation
/*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



