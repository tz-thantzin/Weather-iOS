//
//  WeatherRepository.swift
//  Weather-iOS
//
//  Created by Thant Zin on 2025/10/24.
//

import Foundation

protocol WeatherRepository {
    func getWeather(for city: String) async throws -> WeatherData
}
