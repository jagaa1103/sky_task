//
//  ItinerariesViewModel.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 14/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

struct ItineraryCardViewModel {
    var itinerary:Itinerary!
    
//    Outbound Datas
    var outbound_image: String? {
        return itinerary.OutboundLeg!.getImageLink()
    }
    var outbound_time: String {
        return itinerary.OutboundLeg!.getTime()
    }
    var outbound_cities_flightcompany: String {
        return itinerary.OutboundLeg!.getPlaceAndAgentName()
    }
    var outbound_stop: String {
        return itinerary.OutboundLeg!.getStops()
    }
    var outbound_duration: String {
        return itinerary.OutboundLeg!.getDuration()
    }
//    Inbound Datas
    var inbound_image: String? {
        return itinerary.InboundLeg!.getImageLink()
    }
    var inbound_time: String {
        return itinerary.InboundLeg!.getTime()
    }
    var inbound_cities_flightcompany: String {
        return itinerary.InboundLeg!.getPlaceAndAgentName()
    }
    var inbound_stop: String {
        return itinerary.InboundLeg!.getStops()
    }
    var inbound_duration: String {
        return itinerary.InboundLeg!.getDuration()
    }
//    Footer Datas
    var footer_sentiment_icon: String {
        return ""
    }
    var footer_sentiment_point: String {
        return String(10.0)
    }
    var footer_price: String {
        return  "\u{00a3}" + String(itinerary.getCheapest().Price)
    }
    var footer_booking_count: String {
        if (itinerary.OutboundLeg != nil), (itinerary.InboundLeg != nil) {
            return "2 bookings required"
        } else {
            return "1 booking required"
        }
    }
}



