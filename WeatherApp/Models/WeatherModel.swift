

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let lat, lon: Double
    let timezone: String
    let timezoneOffset: Int
    let current: Current
    let minutely: [Minutely]
    let hourly: [Hourly]
    let daily: [Daily]

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, minutely, hourly, daily
    }
}

// MARK: - Current
struct Current: Codable, Identifiable {
    var id = UUID().uuidString
    let dt: Int
    let sunrise, sunset: Int?
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint, uvi: Double?
    let clouds, visibility: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let weather: [WeatherElement]
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
}

// MARK: - Hourly
struct Hourly: Codable, Identifiable {
    var id = UUID().uuidString
    let dt: Int
    let sunrise, sunset: Int?
    let temp, feelsLike: Double
    let pressure, humidity: Int?
    let dewPoint, uvi: Double?
    let clouds, visibility: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let weather: [WeatherElement]
    let windGust: Double?
    let rain: Rain?
    
    var displayTime: String {
           let currentDate = Date()
           let hourlyDate = Date(timeIntervalSince1970: TimeInterval(dt))

           let calendar = Calendar.current
           let currentHour = calendar.component(.hour, from: currentDate)
           let hourlyHour = calendar.component(.hour, from: hourlyDate)

           if currentHour == hourlyHour {
               return "teď"
           } else {
               let formatter = DateFormatter()
               formatter.dateFormat = "H" // Hodinový formát bez předcházející nuly
               return formatter.string(from: hourlyDate)
           }
       }

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
        case windGust = "wind_gust"
        case rain
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the1H: Double

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let id: Int
    let main: Main
    let description: Description
    let icon: String
    
}

enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
    case mist = "Mist"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case moderateRain = "moderate rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
    case rainAndSnow = "rain and snow"
    case snow = "snow"
    case heavySnow = "heavy snow"
    case lightSnow = "light snow"
    
    
    var systemImageName: String {
        switch self {
        case .brokenClouds:
            return "cloud.sun.fill"
        case .clearSky:
            return "sun.max.fill"
        case .fewClouds:
            return "smoke.fill"
        case .lightRain:
            return "cloud.drizzle.fill"
        case .moderateRain:
            return "cloud.rain.fill"
        case .overcastClouds:
            return "smoke.fill"
        case .scatteredClouds:
            return "cloud.fill"
        case .rainAndSnow:
            return "cloud.snow.fill"
        case .snow:
            return "cloud.snow.fill"
        case .heavySnow:
            return "snowflake"
        case .lightSnow:
            return "cloud.snow.fill"
        }
    }
}

// MARK: - Daily
struct Daily: Codable, Identifiable {
    var id = UUID().uuidString
    let dt, sunrise, sunset, moonrise: Int
    let moonset: Int
    let moonPhase: Double?
    let summary: String
    let temp: Temp
    let feelsLike: FeelsLike?
    let pressure, humidity: Int?
    let dewPoint, windSpeed: Double?
    let windDeg: Int?
    let windGust: Double?
    let weather: [WeatherElement]
    let clouds: Int?
    let pop, uvi: Double?
    let rain: Double?
    
    var displayDay: String {
       
        let timestampDate = Date(timeIntervalSince1970: TimeInterval(dt))
        
        func boldString(_ string: String) -> String {
            return "Today"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current

        let calendar = Calendar.current
        if calendar.isDateInToday(timestampDate) {
            return boldString("Today")
        } else {
            dateFormatter.dateFormat = "EEEE" // Formát pro celý název dne
            return dateFormatter.string(from: timestampDate).capitalized
        }
    }
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case summary, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, clouds, pop, uvi, rain
    }
}

// MARK: - FeelsLike
struct FeelsLike: Codable {
    let day, night, eve, morn: Double
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}

// MARK: - Minutely
struct Minutely: Codable {
    let dt, precipitation: Int
}
