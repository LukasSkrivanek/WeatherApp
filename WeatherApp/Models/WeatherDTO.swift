import Foundation

// MARK: - WeatherDTO
struct WeatherDTO: Codable {
    let lat, lon: Double
    let timezone: String
    let timezoneOffset: Int
    let current: CurrentDTO
    let minutely: [MinutelyDTO]
    let hourly: [HourlyDTO]
    let daily: [DailyDTO]

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, minutely, hourly, daily
    }
}

// MARK: - CurrentDTO
struct CurrentDTO: Codable {
    let dt: Int
    let sunrise, sunset: Int?
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint, uvi: Double?
    let clouds, visibility: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let weather: [WeatherElementDTO]
    
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

// MARK: - HourlyDTO
struct HourlyDTO: Codable {
    let dt: Int
    let sunrise, sunset: Int?
    let temp, feelsLike: Double
    let pressure, humidity: Int?
    let dewPoint, uvi: Double?
    let clouds, visibility: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let weather: [WeatherElementDTO]
    let windGust: Double?
    let rain: RainDTO?

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

// MARK: - RainDTO
struct RainDTO: Codable {
    let the1H: Double
    
    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }

}

// MARK: - WeatherElementDTO
struct WeatherElementDTO: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

// MARK: - DailyDTO
struct DailyDTO: Codable {
    let dt, sunrise, sunset, moonrise, moonset: Int
    let moonPhase: Double?
    let summary: String
    let temp: TempDTO
    let feelsLike: FeelsLikeDTO?
    let pressure, humidity: Int?
    let dewPoint, windSpeed: Double?
    let windDeg: Int?
    let windGust: Double?
    let weather: [WeatherElementDTO]
    let clouds: Int?
    let pop, uvi: Double?
    let rain: Double?
    
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

// MARK: - TempDTO
struct TempDTO: Codable {
    let day, min, max, night, eve, morn: Double
}

// MARK: - FeelsLikeDTO
struct FeelsLikeDTO: Codable {
    let day, night, eve, morn: Double
}

// MARK: - MinutelyDTO
struct MinutelyDTO: Codable {
    let dt, precipitation: Int
}

