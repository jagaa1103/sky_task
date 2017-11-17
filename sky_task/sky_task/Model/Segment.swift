//
//  Segment.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 14/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Segment {
    var ArrivalDateTime: String
    var Carrier: Int
    var DepartureDateTime: String
    var DestinationStation: Int
    var Directionality: String
    var Duration: Int
    var FlightNumber: Int
    var Id: Int
    var JourneyMode: String
    var OperatingCarrier: Int
    var OriginStation: Int
    
    var CarrierDetail: Carrier?
    var OperatingCarrierDetail: Carrier?
    var DestinationPlace: Place?
    var OriginPlace: Place?
    
    init(json: JSON) {
        ArrivalDateTime     = json["ArrivalDateTime"].stringValue
        Carrier             = json["Carrier"].intValue
        DepartureDateTime   = json["DepartureDateTime"].stringValue
        DestinationStation  = json["DestinationStation"].intValue
        Directionality      = json["Directionality"].stringValue
        Duration            = json["Duration"].intValue
        FlightNumber        = json["FlightNumber"].intValue
        Id                  = json["Id"].intValue
        JourneyMode         = json["JourneyMode"].stringValue
        OperatingCarrier    = json["OperatingCarrier"].intValue
        OriginStation       = json["OriginStation"].intValue
    }
    
    mutating func setPlaces(places: [Place]){
        if let index = places.index(where: { $0.Id == self.DestinationStation}) {
            self.DestinationPlace = places[index]
        }
        if let index = places.index(where: { $0.Id == self.OriginStation}) {
            self.OriginPlace = places[index]
        }
    }
    
    mutating func setCarrierDetail(carriers: [Carrier]){
        if let index = carriers.index(where: { $0.Id == self.Carrier}) {
            self.CarrierDetail = carriers[index]
        }
        if let index = carriers.index(where: { $0.Id == self.OperatingCarrier}) {
            self.OperatingCarrierDetail = carriers[index]
        }
    }
}
