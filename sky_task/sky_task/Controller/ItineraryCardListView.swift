//
//  ItineraryListView.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 15/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class ItineraryCardListView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var itineraryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ItineraryListView >> viewDidLoad")
        itineraryTable.dataSource = self
        itineraryTable.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection : 10")
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ItineraryCardView", owner: self, options: nil)?.first as! ItineraryCardView
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 204
    }
}
