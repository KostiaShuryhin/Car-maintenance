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
    }
}

enum ConstGarageFlow{
    
    enum AmountSection {
        static let settingsTVC: Int = 3
        static let descriptionTVC: Int = 1
    }
// MARK: - заменить в коде кол. элементов в массиве
//    enum CountOfCellsInSectionInTVCSettingsCar {
//        static let sectionCarName: Int = 2
//        static let sectionSettings: Int = 6
//        static let sectionButtons: Int = 1
//    }
    
    enum CarNameCellDataRow: String, CaseIterable  {
        case manufacturer = "Марка"
        case model = "Модель" }
    
    enum SettingsCarCellDataRow: String, CaseIterable {
        case carName = "Название"
        case mileage = "Пробег"
        case power = "Мощнасть"
        case fulel = "Вид топлива"
        case yearOfManufacture = "Год выпуска"
        case yearOfPurchase = "Дата покупки"
    }
}
