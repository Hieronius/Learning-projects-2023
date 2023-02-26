//
//  WeatherData.swift
//  JSONpractice v.2
//
//  Created by Арсентий Халимовский on 26.02.2023.
//

import Foundation

// MARK: - WeatherData
struct WeatherData: Codable {
    let hourly: Hourly
}

// MARK: - Hourly
struct Hourly: Codable {
    let time: [String]
    let windspeed10M, temperature2M: [Double]
    let relativehumidity2M: [Int]

    enum CodingKeys: String, CodingKey {
        case time
        case windspeed10M = "windspeed_10m"
        case temperature2M = "temperature_2m"
        case relativehumidity2M = "relativehumidity_2m"
    }
}
