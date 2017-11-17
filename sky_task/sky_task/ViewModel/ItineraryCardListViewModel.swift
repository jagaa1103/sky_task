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
        dataManager.getDatas(completion: { res in
            DispatchQueue.main.async {
                if let list = res {
                    self.itineraries = list
                    print(self.itineraries)
                    completion(true)
                }else{
                    completion(false)
                }
            }
        })
    }
}
