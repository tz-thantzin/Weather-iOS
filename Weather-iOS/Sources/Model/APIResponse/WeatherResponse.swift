//
//  WeatherResponse.swift
//  Weather-iOS
//
//  Created by Thant Zin on 2025/10/24.
//
import Foundation


nonisolated struct WeatherResponse: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    let humidity: Int
}

struct Weather: Decodable {
    let main: String
    let description: String
    let icon: String
}
