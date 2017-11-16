//
//  ItineraryCardTableViewCell.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 15/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class ItineraryCardView: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var viewModel: ItineraryCardViewModel!
    func setData(data: Itinerary){
        DispatchQueue.main.async {
            self.viewModel = ItineraryCardViewModel()
            self.viewModel.itinerary = data
            self.timeLabel.text = self.viewModel.outbound_image
        }
    }
//
//
//    init(data: Itinerary) {
//        super.init(style: .default, reuseIdentifier: "ItineraryCard")
//        viewModel = ItineraryCardViewModel(itinerary: data)
//        outbound_image.image = UIImage(contentsOfFile: viewModel.outbound_image)
//        outbound_time.text = viewModel.outbound_time
//        outbound_cities_flightcompany.text = viewModel.outbound_cities_flightcompany
//        outbound_stop.text = viewModel.outbound_stop
//        outbound_duration.text = viewModel.outbound_duration
//
//        inbound_image.image = UIImage(contentsOfFile: viewModel.inbound_image)
//        inbound_time.text = viewModel.inbound_time
//        inbound_cities_flightcompany.text = viewModel.inbound_cities_flightcompany
//        inbound_stop.text = viewModel.inbound_stop
//        inbound_duration.text = viewModel.inbound_duration
//
//        footer_sentiment_icon.image = UIImage(contentsOfFile: viewModel.footer_sentiment_icon)
//        footer_sentiment_point.text = viewModel.footer_sentiment_point
//        footer_price.text = viewModel.footer_price
//        footer_booking_count.text = viewModel.footer_booking_count
//    }
}
