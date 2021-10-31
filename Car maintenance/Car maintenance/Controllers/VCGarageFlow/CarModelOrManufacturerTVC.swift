//
//  CarModelOrManufacturerTVC.swift
//  Car maintenance
//
//  Created by Константин on 17.09.21.
//

import UIKit

class CarModelOrManufacturerTVC: UITableViewController {

    var destinationUrl: String = ""
    var dataArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if destinationUrl == ConstGarageFlow.CarNameCellDataRow.manufacturer.rawValue {
            
            dataArray = DataFromServer.fechDataManufacture()
            
        } else if destinationUrl == ConstGarageFlow.CarNameCellDataRow.model.rawValue {
            
//            dataArray = DataFromServer.fechDataModel(Current: <#T##String#>)
        }
        

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return ConstGarageFlow.AmountSection.descriptionTVC
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return CarArray.carArray.count
        
        return dataArray.count
        
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "modelOrManufacture", for: indexPath) as! ModelOrManufactureCell
        cell.titleLbl.text = CarArray.carArray[indexPath.row]
        return cell
    }
}
