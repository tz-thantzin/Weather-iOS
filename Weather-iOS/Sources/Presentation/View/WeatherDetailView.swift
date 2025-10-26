//
//  WeatherDetailView.swift
//  Weather-iOS
//
//  Created by Thant Zin on 2025/10/24.
//
import SwiftUI

struct WeatherDetailView: View {
    let weather: WeatherData
    
    var body: some View {
        VStack(spacing: 16) {
            Text(weather.cityName)
                .font(.largeTitle)
                .bold()
            
            Text("\(Int(weather.temperature))°C")
                .font(.system(size: 50))
            
            Text(weather.description.capitalized)
                .font(.title3)
            
            Text("Humidity: \(weather.humidity)%")
                .font(.body)
            
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(weather.icon)@2x.png")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            
            Spacer()
        }
        .padding()
    }
}
