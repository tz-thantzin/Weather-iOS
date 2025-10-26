//
//  Weather_iOSApp.swift
//  Weather-iOS
//
//  Created by Thant Zin on 2025/10/24.
//

import SwiftUI

@main
struct Weather_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: WeatherViewModel(repository: WeatherRepositoryImpl()))
        }
    }
}

