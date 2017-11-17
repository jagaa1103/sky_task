//
//  ItineraryCardTableViewCell.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 15/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class ItineraryCardView: UITableViewCell {
    
    
    @IBOutlet weak var outboundTimeLabel: UILabel!
    @IBOutlet weak var outboundPlaceLabel: UILabel!
    @IBOutlet weak var outboundImage: UIImageView!
    @IBOutlet weak var outboundStopLabel: UILabel!
    @IBOutlet weak var outboundDurationLabel: UILabel!
    
    @IBOutlet weak var inboundTimeLabel: UILabel!
    @IBOutlet weak var inboundPlaceLabel: UILabel!
    @IBOutlet weak var inboundImage: UIImageView!
    @IBOutlet weak var inboundStopLabel: UILabel!
    @IBOutlet weak var inboundDurationLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    var viewModel: ItineraryCardViewModel!
    
    func setData(data: Itinerary){
        viewModel = ItineraryCardViewModel()
        viewModel.itinerary = data
        
        outboundImage.imageFromServerURL(urlString: viewModel.outbound_image!)
        outboundTimeLabel.text = viewModel.outbound_time
        outboundPlaceLabel.text = viewModel.outbound_cities_flightcompany
        outboundStopLabel.text = viewModel.outbound_stop
        outboundDurationLabel.text = viewModel.outbound_duration
        
        inboundImage.imageFromServerURL(urlString: viewModel.inbound_image!)
        inboundTimeLabel.text = viewModel.inbound_time
        inboundPlaceLabel.text = viewModel.inbound_cities_flightcompany
        inboundStopLabel.text = viewModel.inbound_stop
        inboundDurationLabel.text = viewModel.inbound_duration
        
        priceLabel.text = viewModel.footer_price
    }
}

extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        do {
            let data = try Data(contentsOf: URL(string: urlString)!)
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.image = image
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
//extension UIImage {
//    func loadFromServer(urlString: String){
//        do {
//            let data = try Data(contentsOf: URL(string: urlString)!)
//            DispatchQueue.main.async {
//                self.init(data: data)
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//}

