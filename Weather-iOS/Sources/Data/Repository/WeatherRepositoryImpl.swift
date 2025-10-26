//
//  WeatherRepositoryImpl.swift
//  Weather-iOS
//
//  Created by Thant Zin on 2025/10/24.
//
import Foundation

class WeatherRepositoryImpl: WeatherRepository {

    private let service = WeatherService()

    func getWeather(for city: String) async throws -> WeatherData {
        let response = try await service.fetchWeather(for: city)
        return WeatherData(
            cityName: response.name,
            temperature: response.main.temp,
            humidity: response.main.humidity,
            description: response.weather.first?.description ?? "",
            icon: response.weather.first?.icon ?? ""
        )
    }
}


