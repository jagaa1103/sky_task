//
//  Itinerary.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 14/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import Foundation

struct Itinerary: Codable {
//    let bookingDetailsLink: BookingDetailsLink
//    var BookingDetailsLink: BookingDetailsLink {
//        return bookingDetailsLink
//    }
    var InboundLegId: String
    var OutboundLegId: String
//    var PricingOptions: [PricingOptions]
}

struct BookingDetailsLink {
    var Body: String
    var Method: String
    var Uri: String
}

struct PricingOptions {
    var Agents: Int
    var DeeplinkUrl: String
    var Price: Int
    var QuoteAgeInMinutes: Int
}
