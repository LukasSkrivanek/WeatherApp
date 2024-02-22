//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by macbook on 22.01.2024.
//

import SwiftUI

@main
struct WeatherApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            MainView(vm: ContentViewModel())
        }
    }
}
