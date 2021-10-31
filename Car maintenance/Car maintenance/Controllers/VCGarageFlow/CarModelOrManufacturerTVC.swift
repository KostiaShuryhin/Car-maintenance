//
//  CarModelOrManufacturerTVC.swift
//  Car maintenance
//
//  Created by Константин on 17.09.21.
//

import UIKit

class CarModelOrManufacturerTVC: UITableViewController {

    var destinationUrl: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return ConstGarageFlow.AmountSection.descriptionTVC
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CarArray.carArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "modelOrManufacture", for: indexPath) as! ModelOrManufactureCell
        cell.titleLbl.text = CarArray.carArray[indexPath.row]
        return cell
    }
}
