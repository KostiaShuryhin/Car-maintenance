//
//  AddPostVC.swift
//  NetClassWork
//
//  Created by Martynov Evgeny on 26.07.21.
//

import UIKit
import SwiftyJSON
import Foundation

class DataFromServer{

    func fechData (modelOrManufacture: String) -> [String] {
        
        var array = [String]()
        var url: String = ""
        
        switch modelOrManufacture {
        case ConstGarageFlow.CarNameCellDataRow.manufacturer.rawValue:
            url = Constants.Url.forGetManufacturer.rawValue
        case ConstGarageFlow.CarNameCellDataRow.model.rawValue:
            url = Constants.Url.forGetModelFromCar.rawValue
        default:
            return [""]
        }
        
            let headers = [
                "x-rapidapi-host": "car-data.p.rapidapi.com",
                "x-rapidapi-key": "73fe264137msh6661965b82ae8a1p164f55jsn3639d75bec4b"
            ]

            let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                cachePolicy: .useProtocolCachePolicy,
                timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers

        
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if let data = data{
                    let json = JSON(data)
                } else if (error != nil) {
                    print(error)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    print(httpResponse)
                }
            })

            dataTask.resume()
        
        return array
        }
}
//
//extension DataFromServer {
//    func <#name#>(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
//}
