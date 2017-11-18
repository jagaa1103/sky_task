//
//  ItineraryListView.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 15/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class ItineraryCardListView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchBounds: UILabel!
    @IBOutlet weak var itineraryTable: UITableView!
    @IBOutlet weak var searchDate: UILabel!
    @IBOutlet weak var resultSearchCount: UILabel!
    @IBOutlet weak var activitionIndicator: UIActivityIndicatorView!
    var viewModel = ItineraryCardListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitionIndicator.startAnimating()
        registerTableCell()
        itineraryTable.dataSource = self
        itineraryTable.delegate = self
        viewModel.fetchData(completion: { res in
            self.activitionIndicator.stopAnimating()
            if res {
                self.resultSearchCount.text = "\(self.viewModel.numberOfRowsInSection()) of \(self.viewModel.numberOfRowsInSection()) results shown"
                self.itineraryTable.reloadData()
            }else{
                let alert = UIAlertController(title: "Error", message: "Data is not loaded! Please check your connection", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
        
        searchBounds.text = "Edinburgh to London"
        searchDate.text = viewModel.searchDate
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func registerTableCell(){
        let nib = UINib(nibName: "ItineraryCardView", bundle: .main)
        itineraryTable.register(nib, forCellReuseIdentifier: "ItineraryCard")
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
        return 206
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectedRow(index: indexPath.row)
    }
}
