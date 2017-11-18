//
//  Itinerary.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 14/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Itinerary {
    let BookingDetailsLink: DetailsLink
    let InboundLegId: String
    let OutboundLegId: String
    let PricingOptions: [Price]
    
    var OutboundLeg: Leg?
    var InboundLeg: Leg?
    
    var currency: Currency?
    
    init(json: JSON) {
        InboundLegId = json["InboundLegId"].stringValue
        OutboundLegId = json["OutboundLegId"].stringValue
        BookingDetailsLink = DetailsLink(json: json["BookingDetailsLink"])
        PricingOptions =  json["PricingOptions"].arrayValue.map{ return Price(json: $0) }
    }
}

extension Itinerary {
    mutating func setLegs(legs: [Leg]) {
        self.OutboundLeg = getLeg(legs: legs, legId: OutboundLegId)
        self.InboundLeg = getLeg(legs: legs, legId: InboundLegId)
    }
    private func getLeg(legs: [Leg], legId: String) -> Leg? {
        if let i = legs.index(where: { $0.Id == legId }) {
            return legs[i]
        }
        return nil
    }
}

struct DetailsLink {
    var Body: String
    var Method: String
    var Uri: String
    init(json: JSON) {
        Body = json["Body"].stringValue
        Method = json["Method"].stringValue
        Uri = json["Uri"].stringValue
    }
}

struct Price {
    var Agents: Int
    var DeeplinkUrl: String
    var Price: Int
    var QuoteAgeInMinutes: Int
    init(json: JSON){
        Agents = json["Agents"].intValue
        DeeplinkUrl = json["DeeplinkUrl"].stringValue
        Price = json["Price"].intValue
        QuoteAgeInMinutes = json["QuoteAgeInMinutes"].intValue
    }
}
