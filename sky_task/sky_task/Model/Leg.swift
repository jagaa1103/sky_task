//
//  Leg.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 14/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import Foundation

struct Leg {
    var Arrival: Date
    var Carriers: Int
    var Departure: Date
    var DestinationStation: Int
    var Directionality: String
    var Duration: Int
    var FlightNumbers: [FlightNumbers]
    var Id: String
    var JourneyMode: String
    var OperatingCarriers: Int
    var OriginStation: Int
    var SegmentIds: Int
    var Stops: Int
}

struct FlightNumbers {
    var CarrierId: Int
    var FlightNumber: Int
}
