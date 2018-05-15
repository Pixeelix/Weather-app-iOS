//
//  Weather.swift
//  JSON
//
//  Created by Brian Advent on 11.05.17.
//  Modified by Martin Pihooja 07.05.18.

//  Copyright © 2017 Brian Advent. All rights reserved.
//

import Foundation
import CoreLocation

class HistoryData: NSObject {
    
    let locationHistory:String
    let temperaureHistory:String
    
    init(location: String, temperature: String) {
        self.locationHistory  = location
        self.temperaureHistory = temperature
    }
}

struct Weather {
    let summary:String
    let icon:String
    let temperature:Double
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    
    init(json:[String:Any]) throws {
        guard let summary = json["summary"] as? String else {throw SerializationError.missing("Info pole kättesaadav")}
        
        guard let icon = json["icon"] as? String else {throw SerializationError.missing("Pilt puudub")}
        
        guard let temperature = json["temperatureMax"] as? Double else {throw SerializationError.missing("Temperatuur pole kättesaadav")}
        
        self.summary = summary
        self.icon = icon
        self.temperature = temperature
        
    }
    
    // API path and unique key to access the data from https://darksky.net/dev
    static let basePath = "https://api.darksky.net/forecast/2c8cb4f5fdad69d0510f43c82e3a60b0/"
    
    static func forecast (withLocation location:CLLocationCoordinate2D, completion: @escaping ([Weather]?) -> ()) {
        
        let url = basePath + "\(location.latitude),\(location.longitude)" + "?lang=et" + "&units=si"
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
            var forecastArray:[Weather] = []
            
            if let data = data {
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let dailyForecasts = json["daily"] as? [String:Any] {
                            if let dailyData = dailyForecasts["data"] as? [[String:Any]] {
                                for dataPoint in dailyData {
                                    if let weatherObject = try? Weather(json: dataPoint) {
                                        forecastArray.append(weatherObject)
                                    }
                                }
                            }
                        }
                    
                    }
                }catch {
                    print(error.localizedDescription)
                }
                
                completion(forecastArray)
                
            }

        }
        task.resume()
        
    }
    

}
