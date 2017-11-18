//
//  Leg.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 14/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Leg {
    var Arrival: Date?
    var Carriers: [Int]
    var Departure: Date?
    var DestinationStation: Int
    var Directionality: String
    var Duration: Int
    var FlightNumbers: [FlightNumber]
    var Id: String
    var JourneyMode: String
    var OperatingCarriers: Int
    var OriginStation: Int
    var SegmentIds: [Int]
    var Stops: [Int]
    var Segments = [Segment]()
    
    init(json: JSON) {
        Arrival = json["Arrival"].stringValue.toDate()
        Carriers = json["Carriers"].arrayValue.map{ $0.intValue }
        Departure = json["Departure"].stringValue.toDate()
        DestinationStation = json["DestinationStation"].intValue
        Directionality = json["Directionality"].stringValue
        Duration = json["Duration"].intValue
        FlightNumbers = json["FlightNumbers"].arrayValue.map{ return  FlightNumber(CarrierId: $0["CarrierId"].intValue, FlightNumber: $0["FlightNumber"].intValue) }
        Id = json["Id"].stringValue
        JourneyMode = json["JourneyMode"].stringValue
        OperatingCarriers = json["OperatingCarriers"].intValue
        OriginStation = json["OriginStation"].intValue
        SegmentIds = json["SegmentIds"].arrayValue.map{ $0.intValue }
        Stops = json["Stops"].arrayValue.map{ $0.intValue }
    }
}
extension Leg {
    mutating func setSegment(segments: [Segment]){
        self.SegmentIds.forEach({ id in
            if let i = segments.index(where: { $0.Id == id }) {
                self.Segments.append(segments[i])
            }
        })
    }
    
    func getPlaceAndAgentName() -> String {
        if let originPlace = Segments[0].OriginPlace, let departurePlace = Segments[0].DestinationPlace, let carrier = Segments[0].CarrierDetail {
            return "\(originPlace.Code)-\(departurePlace.Code), \(carrier.Name)"
        }
        return ""
    }
    
    func getImageLink() -> String {
        guard let urlString = Segments[0].CarrierDetail?.ImageUrl else { return "" }
        let code = urlString.split(separator: "/").last!
        return "https://logos.skyscnr.com/images/airlines/favicon/\(code)"
    }
    
    func getTime() -> String {
        if let dateArrival = Arrival?.toHHMM(), let dateDeparture = Departure?.toHHMM() { return dateArrival + " - " + dateDeparture }
        return  ""
    }
    func getStops() -> String {
        var text = "Direct"
        if Stops.count > 0 { text = String(Stops.count) + " stops" }
        return text
    }
    func getDuration() -> String {
        var duration = ""
        if Duration > 60 { duration += "\(Duration / 60)h " }
        duration += "\(Duration % 60)m"
        return duration
    }
}

extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter.date(from: self)
    }
}

extension Date {
    func toHHMM()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
}

struct FlightNumber {
    var CarrierId: Int
    var FlightNumber: Int
}
