//
//  HistoryPageTableViewController.swift
//  WeatherMP
//
//  Copyright © 2018 Martin Pihooja. All rights reserved.
//

import UIKit

class HistoryPageTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide back button
         self.navigationItem.setHidesBackButton(true, animated:true);

    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    

}
