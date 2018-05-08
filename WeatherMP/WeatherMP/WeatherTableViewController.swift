//
//  WeatherTableViewController.swift
//  WeatherMP
//
//  Copyright © 2018 Martin Pihooja. All rights reserved.
//

import UIKit
import CoreLocation
import UserNotifications

class WeatherTableViewController: UITableViewController, UISearchBarDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    var forecastData = [Weather]()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNotifications()
        
        searchBar.delegate = self
        // If app starts, get Tallinn weather forecast and show it to user
        // !Need to be changed to current user location instead of Tallinn
        UpdateWeatherForLocation(location: "Tallinn")

        
        // Ask Location
        /*
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        */
        
       
        
    }
    
    func setupNotifications (){
        let notificatioCenter = UNUserNotificationCenter.current()
        
        // If notifications are authorized - set up the notification, else - request authorization from user
        notificatioCenter.getNotificationSettings { (settings) in
            
            if(settings.authorizationStatus == .authorized)
            {
                // Configure the notification
                let notificationContent = UNMutableNotificationContent()
                notificationContent.title = "Ilmajaama teavitus !"
                notificationContent.subtitle = "Kas Sina tead, mis ilma täna tuleb ?"
                notificationContent.body = "Mina juba tean, tule ja vaata ka sina"
                notificationContent.badge = 1 // Show app icon in the notification
                
                // Configure the notification recurring date
                var dateComponents = DateComponents()
                dateComponents.calendar = Calendar.current
                dateComponents.hour = 12     // 12:00 hours
                
                // Set the notification triggger so, that notifications are sent every day 12.00
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                let request = UNNotificationRequest(identifier: "timerDone", content: notificationContent, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }
                
            else
            {
                // Ask permission to send notificatications with sound, alert and badge
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
            }
        }
        
        
        }
    
    // If serch bar button clicked, take inserted text as location
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
        if let locationString = searchBar.text, !locationString.isEmpty{
            UpdateWeatherForLocation(location: locationString)
        }
    }
    
    //Hide keyboard if user starts to scroll down
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    

    
    func UpdateWeatherForLocation (location:String){
        CLGeocoder().geocodeAddressString(location){
            (placemarks:[CLPlacemark]?, error:Error?) in
            if error == nil {
                if let location = placemarks?.first?.location {
                    Weather.forecast(withLocation: location.coordinate, completion: {(results:[Weather]?)
                        in
                        
                        if let weatherData = results {
                            self.forecastData = weatherData
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    })
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return forecastData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    // Add date to table view Section header
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let date = Calendar.current.date(byAdding: .day, value: section, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "et_EE") // Change date language to estonian
        dateFormatter.dateFormat = "dd MMMM yyyy" // Change date format
        
        return dateFormatter.string(from: date!)
    }

    // Add weather information to the table view Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let weatherObject = forecastData[indexPath.section]
        
        cell.textLabel?.text = weatherObject.summary
        cell.detailTextLabel?.text = "\(Int(weatherObject.temperature)) °C"
        cell.imageView?.image = UIImage (named: weatherObject.icon)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
