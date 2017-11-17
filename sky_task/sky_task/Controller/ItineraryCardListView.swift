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
    var viewModel = ItineraryCardListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ItineraryCardView", bundle: .main)
        itineraryTable.register(nib, forCellReuseIdentifier: "ItineraryCard")
        itineraryTable.dataSource = self
        itineraryTable.delegate = self
        viewModel.fetchData(completion: { res in
            if res {
                self.itineraryTable.reloadData()
            }else{
                let alert = UIAlertController(title: "Error", message: "Data is not loaded! Please check your connection", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItineraryCard", for: indexPath) as! ItineraryCardView
        if let info = viewModel.infoByIndex(index: indexPath.row) {
            cell.setData(data: info)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 194
    }
}
