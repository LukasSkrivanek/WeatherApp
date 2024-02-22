//
//  Repository.swift
//  WeatherApp
//
//  Created by macbook on 25.01.2024.
//

import Foundation


protocol WeatherRepository {
    func fetchWeatherData(lat: Double, lon: Double, lang: String, units: String) async throws -> Weather?
}

class WeatherRepositoryImpl: WeatherRepository{
    private let apiService = APIService()
    func fetchWeatherData(lat: Double, lon: Double, lang: String, units: String) async throws -> Weather?{
        do {
            if let weatherData = try await apiService.fetchWeatherData(lat: lat, lon: lon, lang: lang, units: units){
                return DTOToModel().mapDTOtoModel(weatherDTO: weatherData)
            }
            
        } catch {
            throw error
        }
        return nil
    }
    
}
