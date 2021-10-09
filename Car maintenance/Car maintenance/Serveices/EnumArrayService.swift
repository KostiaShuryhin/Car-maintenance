//
//  EnumArrayService.swift
//  Car maintenance
//
//  Created by Константин on 9.10.21.
//

import Foundation

class EnumArraySercice {
    
    var arrayCarNameCellDataRow: [String] {
        get {
            var dataArray = [String]()
            let arrayEnumTipe = ConstGarageFlow.CarNameCellDataRow.allCases

            for item in arrayEnumTipe {
                let itemString: String = item.rawValue
                dataArray.append(itemString)
                return dataArray
            }
        }
    }
    
    var arraySettingsCarCellDataRow: [String] {
        get {
            var dataArray = [String]()
            let arrayEnumTipe = ConstGarageFlow.SettingsCarCellDataRow.allCases

            for item in arrayEnumTipe {
                let itemString: String = item.rawValue
                dataArray.append(itemString)
                return dataArray
            }
        }
    }
}
