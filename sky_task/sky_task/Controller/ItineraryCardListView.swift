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
    let viewModel = ItineraryCardListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ItineraryCardView", bundle: .main)
//        itineraryTable.register(ItineraryCardView.self, forCellReuseIdentifier: "ItineraryCard")
        itineraryTable.register(nib, forCellReuseIdentifier: "ItineraryCard")
        itineraryTable.dataSource = self
        itineraryTable.delegate = self
        viewModel.initSession()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        viewModel.fetchItineraries()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItineraryCard", for: indexPath) as! ItineraryCardView
        cell.setData(data: viewModel.infoOfCellAt(index: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.cellHeight()
    }
}
