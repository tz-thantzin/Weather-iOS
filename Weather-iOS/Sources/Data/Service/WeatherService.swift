//
//  WeatherService.swift
//  Weather-iOS
//
//  Created by Thant Zin on 2025/10/24.
//
import Alamofire
import Foundation

class WeatherService {
    func fetchWeather(for city: String) async throws -> WeatherResponse {
        let parameters: [String: String] = [
            "q": city,
            "appid": APIConstants.apiKey,
            "units": "metric"
        ]
        
        // Alamofire async + serializingDecodable automatically decodes in background
        let response = AF.request(APIConstants.baseURL, parameters: parameters)
            .validate()
            .serializingDecodable(WeatherResponse.self)
        
        return try await response.value
    }
}
