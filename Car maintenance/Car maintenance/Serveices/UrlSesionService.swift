//
//  AddPostVC.swift
//  NetClassWork
//
//  Created by Martynov Evgeny on 26.07.21.
//

import UIKit
import SwiftyJSON
import Foundation

class DataFromServer {

    func fechDataManufacture () -> [String] {

        var array = [String]()

        let url: String = ConstAPI.Url.forGetManufacturer.rawValue
//        var boolToSwichURLManufacturer: Bool?
//        var dataToGET: String = ""


//        switch modelOrManufacture {
//        case ConstGarageFlow.CarNameCellDataRow.manufacturer.rawValue:
//            url = Constants.Url.forGetManufacturer.rawValue
//            boolToSwichURLManufacturer = true
////            dataToGET =
//        case ConstGarageFlow.CarNameCellDataRow.model.rawValue:
//            url = Constants.Url.forGetModelFromCar.rawValue
//            boolToSwichURLManufacturer = false
////            dataToGET =
//        default:
//            print("non valid reqest to get API data")
//            break
//        }

        let headers = ConstAPI.heder.rapidapi

        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers


        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { [weak self] (data, response, error) -> Void in
            if let data = data {
                let json = JSON(data)

                let numberOfManufacture = json[].count
                for item in 0..<numberOfManufacture {
                    array.append(json["\(item)"].stringValue) }

            } else if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse as Any)
            }
        })

        dataTask.resume()

        return array
    }

    func fechDataModel (Current carManufacture: String) -> ([String]) {
        var array = [String]()
        var url: String = ConstAPI.Url.forGetManufacturer.rawValue

        let headers = ConstAPI.heder.rapidapi

        for page in 0...4 {

            if carManufacture.isEmpty {
                url += "\(page)"
            } else {
                url += "\(page)"
                url += "&make=\(carManufacture)"
            }
            print(url)

            let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                cachePolicy: .useProtocolCachePolicy,
                timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers

            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if let data = data {
                    let json = JSON(data)
                    
                    array = json[].dictionaryValue. {$0["model"].stringValue}
//                    первый попаушийся способ

                } else {
                    
                    
                }
                
                
                if (error != nil) {
                    print(error)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    print(httpResponse)
                }
            })

            dataTask.resume()






        }
    }
}
