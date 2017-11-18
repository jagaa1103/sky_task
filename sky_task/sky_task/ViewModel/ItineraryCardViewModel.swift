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
        guard let leg = itinerary.OutboundLeg else { return nil }
        guard let urlString = leg.Segments[0].CarrierDetail?.ImageUrl else { return nil }
        let code = urlString.split(separator: "/").last!
        return "https://logos.skyscnr.com/images/airlines/favicon/\(code)"
    }
    var outbound_time: String {
        if let dateArrival = itinerary.OutboundLeg?.Arrival?.toHHMM(), let dateDeparture = itinerary.OutboundLeg?.Departure?.toHHMM() {
            return dateArrival + " - " + dateDeparture
        }
        return  ""
    }
    var outbound_cities_flightcompany: String {
        if let originPlace = itinerary.OutboundLeg?.Segments[0].OriginPlace, let departurePlace = itinerary.OutboundLeg?.Segments[0].DestinationPlace, let carrier = itinerary.OutboundLeg?.Segments[0].CarrierDetail {
            return "\(originPlace.Code)-\(departurePlace.Code), \(carrier.Name)"
        } else {
            return ""
        }
    }
    var outbound_stop: String {
        var text = "Direct"
        if let stops = itinerary.OutboundLeg?.Stops, stops.count > 0 {
            text = String(stops.count) + " stops"
        }
        return text
    }
    var outbound_duration: String {
        guard let leg = itinerary.OutboundLeg else { print("Duration is not found"); return "" }
        let hour = leg.Duration / 60
        let minutes = leg.Duration % 60
        if hour > 0 {
            return "\(hour)h \(minutes)m"
        }else{
            return "\(minutes)m"
        }
    }
//    Inbound Datas
    var inbound_image: String? {
        guard let leg = itinerary.InboundLeg else { return nil }
        guard let urlString = leg.Segments[0].CarrierDetail?.ImageUrl else { return nil }
        let code = urlString.split(separator: "/").last!
        return "https://logos.skyscnr.com/images/airlines/favicon/\(code)"
    }
    var inbound_time: String {
        if let dateArrival = itinerary.InboundLeg?.Arrival?.toHHMM(), let dateDeparture = itinerary.InboundLeg?.Departure?.toHHMM() {
            return dateArrival + " - " + dateDeparture
        }
        return  ""
    }
    var inbound_cities_flightcompany: String {
        if let leg = itinerary.InboundLeg {
            if let originPlace = leg.Segments[0].OriginPlace, let departurePlace = leg.Segments[0].DestinationPlace, let carrier = leg.Segments[0].CarrierDetail {
                    return "\(originPlace.Code)-\(departurePlace.Code), \(carrier.Name)"
            }
            return ""
        } else {
            return ""
        }
    }
    var inbound_stop: String {
        var text = "Direct"
        if let stops = itinerary.InboundLeg?.Stops, stops.count > 0 {
            text = String(stops.count) + " stops"
        }
        return text
    }
    var inbound_duration: String {
        guard let leg = itinerary.InboundLeg else { print("Duration is not found"); return "" }
        let hour = leg.Duration / 60
        let minutes = leg.Duration % 60
        if hour > 0 {
            return "\(hour)h \(minutes)m"
        }else{
            return "\(minutes)m"
        }
    }
//    Footer Datas
    var footer_sentiment_icon: String {
        return ""
    }
    var footer_sentiment_point: String {
        return String(10.0)
    }
    var footer_price: String {
        let currency = "\u{00a3}"
        return  currency + String(itinerary.PricingOptions[0].Price)
    }
    var footer_booking_count: String {
        if (itinerary.OutboundLeg != nil), (itinerary.InboundLeg != nil) {
            return "2 bookings required"
        } else {
            return "1 booking required"
        }
    }
}


