//
//  ItinerariesViewModel.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 14/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

struct ItineraryCardViewModel {
    var itinerary:Itinerary!
    
//    Outbound Datas
    var outbound_image: String {
        return itinerary.InboundLegId
    }
    var outbound_time: String {
        return itinerary.InboundLegId
    }
    var outbound_cities_flightcompany: String {
        return itinerary.InboundLegId
    }
    var outbound_stop: String {
        return itinerary.InboundLegId
    }
    var outbound_duration: String {
        return itinerary.InboundLegId
    }
//    Inbound Datas
    var inbound_image: String {
        return itinerary.InboundLegId
    }
    var inbound_time: String {
        return itinerary.InboundLegId
    }
    var inbound_cities_flightcompany: String {
        return itinerary.InboundLegId
    }
    var inbound_stop: String {
        return itinerary.InboundLegId
    }
    var inbound_duration: String {
        return itinerary.InboundLegId
    }
//    Footer Datas
    var footer_sentiment_icon: String {
        return itinerary.InboundLegId
    }
    var footer_sentiment_point: String {
        return itinerary.InboundLegId
    }
    var footer_price: String {
        return itinerary.InboundLegId
    }
    var footer_booking_count: String {
        return itinerary.InboundLegId
    }

}
