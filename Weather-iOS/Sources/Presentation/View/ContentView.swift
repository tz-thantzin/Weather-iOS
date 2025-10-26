//
//  ContentView.swift
//  Weather-iOS
//
//  Created by Thant Zin on 2025/10/24.
//
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: WeatherViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter city name", text: $viewModel.city, onEditingChanged: { _ in
                    viewModel.searchCity()
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                } else if let weather = viewModel.weather {
                    WeatherDetailView(weather: weather)
                        .refreshable {
                            viewModel.refresh()
                        }
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    Text("Search for a city to see weather")
                        .padding()
                }
                
                Spacer()
            }
            .navigationTitle("Weather")
        }
    }
}
