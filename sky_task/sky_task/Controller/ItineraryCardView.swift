//
//  ItineraryCardTableViewCell.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 15/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class ItineraryCardView: UITableViewCell {
    
    let viewModel = ItineraryCardViewModel()
    
    @IBOutlet weak var outboundView: UIView!
    @IBOutlet weak var inboundView: UIView!
    @IBOutlet weak var footerView: UIView!
    
    @IBOutlet weak var outbound_image: UIImageView!
    @IBOutlet weak var outbound_time: UILabel!
    @IBOutlet weak var outbound_cities_flightcompany: UILabel!
    @IBOutlet weak var outbound_stop: UILabel!
    @IBOutlet weak var outbound_duration: UILabel!
    
    @IBOutlet weak var inbound_image: UIImageView!
    @IBOutlet weak var inbound_time: UILabel!
    @IBOutlet weak var inbound_cities_flightcompany: UILabel!
    @IBOutlet weak var inbound_stop: UILabel!
    @IBOutlet weak var inbound_duration: UILabel!
    
    @IBOutlet weak var footer_sentiment_icon: UIImageView!
    @IBOutlet weak var footer_sentiment_point: UILabel!
    @IBOutlet weak var footer_price: UILabel!
    @IBOutlet weak var footer_booking_count: UILabel!
    
    
}
