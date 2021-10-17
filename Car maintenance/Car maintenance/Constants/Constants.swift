//
//  Constants.swift
//  Car maintenance
//
//  Created by Константин on 12.09.21.
//

import Foundation

enum Constants {
    enum Segues {
        static let mainView = "mainView"
        static let addMyCar = "IdAddMyCar"
        static let userCarIsNotEmpty = "userCarIsNotEmptySegua"
        static let settingsCarIsEmpty = "settingsCarIsEmpty"
        static let createUserCar = "createUserCar"
        static let carModelOrManufacturer = "carModelOrManufacturer"
    }
    
    enum FireBase {
        static let users = "users"
        static let user = "user"
        static let userCars = "userCars"
    }
    

}

enum ConstAPI {
    enum Url: String {
        case forGetManufacturer = "https://car-data.p.rapidapi.com/cars/makes"
        case forGetModelFromCar = "https://car-data.p.rapidapi.com/cars?limit=50&page=0"
    }
    
    enum heder {
        static let rapidapi: [String : String] = [
        "x-rapidapi-host": "car-data.p.rapidapi.com",
        "x-rapidapi-key": "73fe264137msh6661965b82ae8a1p164f55jsn3639d75bec4b"
    ]
    }
}

enum ConstGarageFlow{
    
    enum AmountSection {
        static let settingsTVC: Int = 3
        static let descriptionTVC: Int = 1
    }
    
    enum CarNameCellDataRow: String, CaseIterable  {
        case manufacturer = "Марка"
        case model = "Модель"
    }
    
    enum SettingsCarCellDataRow: String, CaseIterable {
        case carName = "Название"
        case mileage = "Пробег"
        case power = "Мощность"
        case fulel = "Вид топлива"
        case yearOfManufacture = "Год выпуска"
        case yearOfPurchase = "Дата покупки"
    }
    
    enum SettingsCarDefoltValu: String, CaseIterable {
        case carName = "ford Fusion"
        case mileage = "74500 км"
        case power = "176 л.с."
        case fulel = "АИ-95"
        case yearOfManufacture = "2015"
        case yearOfPurchase = "20.08.2021"
    }
    
    enum ButtonCellAmount {
        static let oneCell: Int = 1
    }
    
    enum DescriprionCellDataRow {
    }

}

//enum ConstMaintenance {
//    enum MaintananceCell: String, CaseIterable {
//
//    }
//}
