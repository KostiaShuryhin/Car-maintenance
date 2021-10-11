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
    
    enum Url: String {
        case forGetManufacturer = "https://car-data.p.rapidapi.com/cars/makes"
        case forGetModelFromCar = "https://car-data.p.rapidapi.com/cars?limit=10&page=0"
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
