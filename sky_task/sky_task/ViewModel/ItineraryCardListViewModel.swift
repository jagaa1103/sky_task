//
//  ItineraryCardListViewModel.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 15/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import Foundation

class ItineraryCardListViewModel {
    let dataManager = DataManager()
    var itineraries = [Itinerary]()
    
    var searchDate: String {
        let dateString = dataManager.getDates().0.formatMMM + " - " + dataManager.getDates().1.formatMMM
        return dateString
    }
    
    func numberOfRowsInSection()->Int {
        return itineraries.count
    }
    
    func infoByIndex(index: Int) -> Itinerary? {
        if itineraries.count > 0 {
            return itineraries[index]
        } else {
            return nil
        }
    }
    
    func fetchData(completion: @escaping (Bool)->Void ){
        let dates = dataManager.getDates()
        dataManager.getDatas(outboundDate: dates.0.formatYYYY, inboundDate: dates.1.formatYYYY, completion: { res in
            DispatchQueue.main.async {
                if let list = res {
                    self.itineraries = list
                    completion(true)
                }else{
                    completion(false)
                }
            }
        })
    }
    
    func didSelectedRow(index:Int){
        print(self.itineraries[index])
    }
}
