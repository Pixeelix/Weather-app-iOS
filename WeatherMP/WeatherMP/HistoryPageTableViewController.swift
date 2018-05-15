//
//  HistoryPageTableViewController.swift
//  WeatherMP
//
//  Copyright © 2018 Martin Pihooja. All rights reserved.
//

import UIKit

class HistoryPageTableViewController: UITableViewController {
    
    var locationHistoryArray = [String]()
    var tempHistoryArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide back button
         self.navigationItem.setHidesBackButton(true, animated:true);
        
    }
    // Update the table every time view will appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        // Get user location history
        locationHistoryArray = UserDefaults.standard.stringArray(forKey: "LocationArray") ?? [String]()
        // Get user temp history
        tempHistoryArray = UserDefaults.standard.stringArray(forKey: "TempArray") ?? [String]()
        
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return locationHistoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    // Add date to the section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Siia tuleb kuupäev\(section)"
    }
    
    
    
    // Add table view cell information
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath)
        
        cell.textLabel?.text = locationHistoryArray[indexPath.section]
        cell.detailTextLabel?.text = (tempHistoryArray[indexPath.section]) + " °C"
        
        return cell
    }
    

}
