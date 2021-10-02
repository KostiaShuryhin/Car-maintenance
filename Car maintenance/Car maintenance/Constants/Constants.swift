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
    enum NumberOfMenuSectionTVC {
        static let InSettingsCarTVC: Int = 3
    }
     
    enum CountOfCellsInSectionInTVCSettingsCar {
        static let sectionCarName: Int = 2
        static let sectionSettings: Int = 6
        static let sectionButtons: Int = 1
    }
}
