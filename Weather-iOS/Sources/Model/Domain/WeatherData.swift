//
//  WeatherData.swift
//  Weather-iOS
//
//  Created by Thant Zin on 2025/10/24.
//
import Foundation

struct WeatherData: Identifiable {
    let id = UUID()
    let cityName: String
    let temperature: Double
    let humidity: Int
    let description: String
    let icon: String
}

