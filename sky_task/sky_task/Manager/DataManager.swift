//
//  DataManager.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 13/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import SwiftyJSON

class DataManager {
    let urlString = "http://business.skyscanner.net/apiservices/pricing/v1.0/"
    let headers1 = [ "Content-Type": "application/x-www-form-urlencoded" ]
    let headers2 = [ "Accept": "application/json" ]
    let params2 = [
//        "pageIndex": "0",
//        "pageSize": "10",
        "apiKey": "ss630745725358065467897349852985"
    ]
    var session = ""
    var currencies = [Currency]()
    
    func requestSession(outDate: String, inDate: String, completion: @escaping (Bool)->()){
        if session != "" {
            completion(true)
            return
        }
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
            "outbounddate": outDate,
            "inbounddate": inDate,
            "adults":"1",
            "children":"0",
            "infants":"0",
            "cabinclass":"Economy"
        ]
        Alamofire.request(urlString, method: .post, parameters: params1, encoding: URLEncoding(), headers: headers1).response{ response in
            if let error = response.error {
                print("getSession : " + error.localizedDescription)
                completion(false)
            }else {
                response.response?.allHeaderFields.forEach({ item in
                    if item.key.description == "Location" {
                        self.session = "\(item.value)"
                        completion(true)
                    }else{
                        completion(false)
                    }
                })
            }
        }
    }
    
    func getDatas(outboundDate: String, inboundDate: String, completion: @escaping ([Itinerary]?)->()) {
        requestSession(outDate: outboundDate, inDate: inboundDate, completion: { res in
            if res {
                return self.requestData(completion: { res in
                    completion(res)
                })
            }
        })
    }
    
    func requestData(completion: @escaping ([Itinerary]?)->()) {
        Alamofire.request(session, method: .get, parameters: params2, encoding: URLEncoding(), headers: headers2).responseJSON{ response in
            switch response.result {
            case .success(let value):
                print("data is arrived")
                completion(self.parseToItineraries(json: JSON(value)))
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
}

extension DataManager {
    func parseToItineraries(json: JSON) -> [Itinerary] {
        let Places = json["Places"].arrayValue.map{ return Place(json: $0) }
        let Carriers = json["Carriers"].arrayValue.map{ return Carrier(json: $0) }
        var itineraries = [Itinerary]()
        var Segments = [Segment]()
        var Legs = [Leg]()
        
        currencies = json["Currencies"].arrayValue.map{ return Currency(json: $0) }
        
        json["Segments"].arrayValue.forEach{
            var segment = Segment(json: $0)
            segment.setPlaces(places: Places)
            segment.setCarrierDetail(carriers: Carriers)
            Segments.append(segment)
        }
        json["Legs"].arrayValue.forEach{
            var leg = Leg(json: $0)
            leg.setSegment(segments: Segments)
            Legs.append(leg)
        }
        json["Itineraries"].arrayValue.forEach {
            var itinerary = Itinerary(json: $0)
            itinerary.setLegs(legs: Legs)
            if currencies.count > 0 {
                itinerary.currency = currencies[0]
            }
            itineraries.append(itinerary)
        }
        return itineraries
    }
    
    func getFlightDatesYYYY() -> (String, String) {
        let dates = getDates()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let strNextMonday = formatter.string(from: dates.0)
        let strFollowingDay = formatter.string(from: dates.1)
        return (strNextMonday, strFollowingDay)
    }
    
    func getFlightDatesMMM() -> String {
        let dates = getDates()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd., EEE"
        let strDate = formatter.string(from: dates.0) + " - " + formatter.string(from: dates.1)
        return strDate
    }
    
    func getDates() -> (Date, Date){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let strDate = dateFormatter.string(from: Date())
        var dayDiff = 0.0
        switch strDate {
        case "Monday":
            dayDiff = 7
        case "Tuesday":
            dayDiff = 6
        case "Wednesday":
            dayDiff = 5
        case "Thursday":
            dayDiff = 4
        case "Friday":
            dayDiff = 3
        case "Saturday":
            dayDiff = 2
        case "Sunday":
            dayDiff = 1
        default:
            dayDiff = 0
        }
        let nextMonday = Date(timeIntervalSinceNow: 86400 * dayDiff)
        let followingDay = Date(timeIntervalSinceNow: 86400 * (dayDiff + 1))
        return (nextMonday, followingDay)
    }
}
