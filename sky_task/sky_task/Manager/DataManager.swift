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
    typealias ItineraryListListener = ()->Array<Itinerary>?
    let urlString = "http://business.skyscanner.net/apiservices/pricing/v1.0/"
    let headers1 = [ "Content-Type": "application/x-www-form-urlencoded" ]
    let headers2 = [ "Accept": "application/json" ]
    let params1 = [
        "foo": "bar",
        "country":"UK",
        "currency":"GBP",
        "locale":"en-GB",
        "locationSchema":"sky",
        "apikey": "ss630745725358065467897349852985",
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
    let params2 = [
        "pageIndex": "0",
        "pageSize": "10",
        "apiKey": "ss630745725358065467897349852985"
    ]

    var session = ""
    
    func requestSession(completion: @escaping (Bool)->()){
        if session != "" {
            completion(true)
            return
        }
        Alamofire.request(urlString, method: .post, parameters: params1, encoding: URLEncoding(), headers: headers1).response{ response in
            if let error = response.error {
                print("getSession : " + error.localizedDescription)
                completion(false)
            }else {
                response.response?.allHeaderFields.forEach({ item in
                    if item.key.description == "Location" {
                        print("getSession: Session url = \(item.value)")
                        self.session = "\(item.value)"
                        completion(true)
                    }else{
                        completion(false)
                    }
                })
            }
        }
    }
    
    func getDatas() -> ItineraryListListener? {
        requestSession(completion: { res in
            if res {
                return self.requestData()
            }
        })
    }
    
    func requestData() -> ItineraryListListener {
        Alamofire.request(session, method: .get, parameters: params2, encoding: URLEncoding(), headers: headers2).responseJSON{ response in
            if let error = response.error {
                print("getDatas: " + error.localizedDescription)
                return nil
            }else{
                return self.jsonToItineraries(data: response.data!)
            }
        }
    }
}

extension DataManager {
    func jsonToItineraries(data: Data) -> Array<Itinerary>? {
        print(data)
        do {
            let itineraries = try JSONDecoder().decode([Itinerary].self, from: data)
            return itineraries
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
