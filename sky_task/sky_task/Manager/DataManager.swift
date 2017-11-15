//
//  DataManager.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 13/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import Alamofire

class DataManager {
    let urlString = "http://business.skyscanner.net/apiservices/pricing/v1.0/"
    let apiKey = "ss630745725358065467897349852985"
    
    func getData(){
        let url = URL(string: urlString)!
        let parameters = [
            "foo": "bar",
            "country":"UK",
            "currency":"GBP",
            "locale":"en-GB",
            "locationSchema":"sky",
            "apikey": apiKey,
            "grouppricing":"on",
            "originplace":"EDI-sky",
            "destinationplace":"LOND-sky",
            "outbounddate":"2017-11-20",
            "inbounddate":"2017-11-27",
            "adults":"1",
            "children":"0",
            "infants":"0",
            "cabinclass":"Economy"
        ]
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding(), headers: headers).response{ response in
            if let error = response.error {
                print(error.localizedDescription)
            }else {
                response.response?.allHeaderFields.forEach({ item in
                    if item.key.description == "Location" {
                        self.getDatas(url: "\(item.value)")
                    }
                })
            }
        }
    }
    
    func getDatas(url: String){
        print(url)
        let headers = [
            "Accept": "application/json"
        ]
        let parameters = [
            "pageIndex": "0",
            "pageSize": "10",
            "apiKey": apiKey
        ]
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding(), headers: headers).responseJSON{ response in
            do {
                let json = try JSONSerialization.jsonObject(with: response.data!)
                print(json)
            } catch {
                print(error)
            }
        }
    }
}
