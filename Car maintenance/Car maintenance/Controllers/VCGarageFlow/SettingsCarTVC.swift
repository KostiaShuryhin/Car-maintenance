//
//  SettingsCarTVC.swift
//  Car maintenance
//
//  Created by Константин on 17.09.21.
//

import UIKit
import Firebase

class SettingsCarTVC: UITableViewController {

//    let user: User! = nil
//    var ref: DatabaseReference! = nil
//    let userCar = [UserCar]()

    override func viewDidLoad() {
        super.viewDidLoad()

//        guard let currentUser = Auth.auth().currentUser else { return }
//        let user = User(user: currentUser)
//        ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("userCar")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.NumberOfMenuSectionTVC.InSettingsCarTVC
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowsInSection: Int = 0
        if section == 0 { rowsInSection = Constants.CountOfCellsInSectionInTVCSettingsCar.sectionCarName }
        else if section == 1 { rowsInSection = Constants.CountOfCellsInSectionInTVCSettingsCar.sectionSettings }
        else if section == 2 { rowsInSection = Constants.CountOfCellsInSectionInTVCSettingsCar.sectionButtons }
        return rowsInSection
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)


        // Configure the cell...

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
