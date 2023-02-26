//
//  APIManager.swift
//  JSONpractice v.2
//
//  Created by Арсентий Халимовский on 26.02.2023.
//

import Foundation

// file for class which supposed to work with JSON data
class APIManager {
    
    // singleton here
    static let shared = APIManager()
    
    /// our Api address
    let urlString = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&past_days=10&hourly=temperature_2m,relativehumidity_2m,windspeed_10m"
    
    // function to get data from Api
    func getWeather() {
        // 1. assign current URL address of our API
        let url = URL(string: urlString)!
        
        // 2. set type of the request
        var request = URLRequest(url: url)
        
        // 3. set a task
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // 3.1 get our response here
            print(response)
        }
        // 4. load the task
        task.resume()
        
    }
}
