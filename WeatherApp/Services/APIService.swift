//
//  APIService.swift
//  WeatherApp
//
//  Created by macbook on 22.01.2024.
//

import Foundation

class APIService{
    let baseURL = "https://api.openweathermap.org/data/3.0/onecall"
    let apiKey = "c37e123ae13c0e5c09b6fc9f30828111"
    
    func buildURL(lat: Double, lon: Double, lang: String, units: String) -> URL? {
        var components = URLComponents(string: baseURL)
        components?.queryItems = [
            URLQueryItem(name: "lat", value: "\(lat)"),
            URLQueryItem(name: "lon", value: "\(lon)"),
            URLQueryItem(name: "lang", value: "\(lang)"),
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "units", value: units)
        ]
        return components?.url // Vrací kompletní URL
    }
    
    func fetchWeatherData(lat: Double, lon: Double, lang: String, units: String) async throws -> WeatherDTO? {
        guard let url =  buildURL(lat: lat, lon: lon, lang: lang, units: units) else {
            throw URLError(.badURL)
        }        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        do {
            let weatherData = try JSONDecoder().decode(WeatherDTO.self, from: data)
            return weatherData
        } catch {
            print("chyna při dekodovani\(error)")
        }
        
        return nil
       
    }
}
