//
//  ItineraryCardListViewModel.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 15/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

struct ItineraryCardListViewModel {
    let dataManager = DataManager()
    var itineraries = Array<Itinerary>()
    
    func numberOfRowsInSection()->Int {
        return 10
    }
    
    func infoOfCellAt(index: Int) -> Itinerary {
        if itineraries.count > 0 {
            return itineraries[index]
        } else {
            return Itinerary(InboundLegId: "inBoundLegId in here", OutboundLegId: "outBoundLegId in here")
        }
    }
    
    func cellAt(index: Int) -> UITableViewCell {
        return ItineraryCardView()
    }
    
    func cellHeight()->CGFloat {
        return 194
    }
}

extension ItineraryCardListViewModel {
    func initSession(){
        dataManager.getSession()
    }
    func fetchItineraries(){
//        dataManager.getData(completion: { res in
//            if let itineraryList = res {
//                for itinerary in itineraryList {
//                    print("InboundLegId : \(itinerary.InboundLegId), OutboundLegId : \(itinerary.OutboundLegId)")
//                }
//            }
//        })
    }
}
