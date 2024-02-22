//
//  ContentViewmodel.swift
//  WeatherApp
//
//  Created by macbook on 22.01.2024.
//

import Foundation
import Observation


class ContentViewModel: ObservableObject{
    @Published var weatherLoaded: Weather?
    var errorMessage: String?
    var isLoading: Bool = false
    let weatherRepo = WeatherRepositoryImpl()
    init() {
        self.errorMessage = nil
        Task{
            do {
                let fetchedWeather = try await weatherRepo.fetchWeatherData(lat: 40.7128, lon: -74.0060, lang: "en", units: "metric")
                DispatchQueue.main.async {

                    self.weatherLoaded = fetchedWeather
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }     
    }
}
