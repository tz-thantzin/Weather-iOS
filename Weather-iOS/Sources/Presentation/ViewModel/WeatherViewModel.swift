//
//  WeatherViewModel.swift
//  Weather-iOS
//
//  Created by Thant Zin on 2025/10/24.
//
import Foundation
import SwiftUI
import Combine 
@MainActor
class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherData?
    @Published var city: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let repository: WeatherRepository
    private let debouncer = Debouncer(interval: 0.5)
    
    init(repository: WeatherRepository) {
        self.repository = repository
    }
    
    func searchCity() {
        debouncer.run { [weak self] in
            Task { await self?.fetchWeather() }
        }
    }
    
    func fetchWeather() async {
        guard !city.isEmpty else { return }
        print("Searching city:", city)
        isLoading = true
        errorMessage = nil
        
        do { 
            let data = try await repository.getWeather(for: city)
            weather = data
        } catch {
            print("Error:", error.localizedDescription)
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func refresh() {
        Task { await fetchWeather() }
    }
}
