//
//  cars.swift
//  Car maintenance
//
//  Created by Константин on 19.09.21.
//

import Foundation
import Firebase

struct UserCar {

    var maker: String
    let model: String
    let carMileage: Int?
    let enginePower: Int?
    let fuel: String?
    let yearOfManufacture: Date?
    let yearOfPurchase: Date?
    let ref: DatabaseReference?

    // для создания объекта локально
    init (maker: String, model: String, carMileage: Int, enginePower: Int?, guel: Int?, fuel: String?, yearOfManufacture: Date?, yearOfPurchase: Date?) {
        self.maker = maker
        self.model = model
        self.carMileage = carMileage
        self.enginePower = enginePower
        self.fuel = fuel
        self.yearOfManufacture = yearOfManufacture
        self.yearOfPurchase = yearOfPurchase
        self.ref = nil
    }

    // для создания объекта из сети
    init?(snapshot: DataSnapshot) {
        guard let snapshotValu = snapshot.value as? [String: Any],
            let maker = snapshotValu[Constants.makerKey] as? String,
            let model = snapshotValu[Constants.modelKey] as? String,
            let carMileage = snapshotValu[Constants.carMileageKey] as? Int?,
            let enginePower = snapshotValu[Constants.enginePowerKey] as? Int?,
            let fuel = snapshotValu[Constants.fuelKey] as? String?,
            let yearOfManufacture = snapshotValu[Constants.yearOfManufactureKey] as? Date?,
            let yearOfPurchase = snapshotValu[Constants.yearOfPurchaseKey] as? Date?
            else { return }
        self.maker = maker
        self.model = model
        self.carMileage = carMileage
        self.enginePower = enginePower
        self.fuel = fuel
        self.yearOfManufacture = yearOfManufacture
        self.yearOfPurchase = yearOfPurchase
        ref = snapshot.ref
    }

    func convertToDictionary() -> [String: Any] {
        [Constants.makerKey: maker,
            Constants.modelKey: model,
            Constants.carMileageKey: carMileage ?? nil,
            Constants.enginePowerKey: enginePower ?? nil,
            Constants.fuelKey: fuel ?? nil,
            Constants.yearOfManufactureKey: yearOfManufacture ?? nil,
            Constants.yearOfPurchaseKey: yearOfPurchase ?? nil]
    }

    private enum Constants {
        static let makerKey = "maker"
        static let modelKey = "model"
        static let carMileageKey = "carMileage"
        static let enginePowerKey = "enginePower"
        static let fuelKey = "fuel"
        static let yearOfManufactureKey = "yearOfManufacture"
        static let yearOfPurchaseKey = "yearOfPurchase"
    }
}
