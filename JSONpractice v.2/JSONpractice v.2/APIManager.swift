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
    // 2.1.1 After when we got data from previous steps we should define this function as escaping closure because we can't use it in our table view right now
    // add - getWeather(comlition: @escaping ([Double]) -> Void)
    // Double here becuase of the data type of the WeatherData.hourly.temperature2M
    // So, probably i need different closures for any types of the data in my New's App
    func getWeather(completion: @escaping ([Double]) -> Void) {
        // 1. assign current URL address of our API
        let url = URL(string: urlString)!
        
        // 2. set type of the request
        var request = URLRequest(url: url)
        
        // 3. set a task
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // 3.1 get our response here
            // time to parse our data after we create WeatherData file
            
            // a. safely check is there any files in data or not
            guard let data else { return }
            
            // b. check our weatherData
            // use JSONDecoder().decode for this purposes
            // into which type we wan't parse our data - WeatherData.self
            // from what source we wan't get data to parse - data (we got it raw from Api)
            if let weatherData = try? JSONDecoder().decode(WeatherData.self, from: data) {
                // if there is a success let's print all data which we can use for table view cell:
                // if we can see data on the screen after command print it's mean we already have access of this data in our table view cell
                // may be just need to use another singleton from different file.
                // I mean if we got this data In APIManager itself, so we should define a variable to get access to this data in ViewController or in file with TableViewCell where we should set this data to cell properties
                completion(weatherData.hourly.temperature2M)
                
                
                // just example of all possible data you can get here:
                print(weatherData.hourly.temperature2M)
                print(weatherData.hourly.relativehumidity2M)
                print(weatherData.hourly.time)
                print(weatherData.hourly.windspeed10M)
                
            } else {
                print("FAIL")
            }
            
        }
        // 4. load the task
        task.resume()
        
    }
}
