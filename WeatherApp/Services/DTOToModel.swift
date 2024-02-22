//
//  DTOToModel.swift
//  WeatherApp
//
//  Created by macbook on 08.02.2024.
//

import Foundation


class DTOToModel{
    func mapDTOtoModel(weatherDTO: WeatherDTO) -> Weather {
        let current = Current(
            id: UUID().uuidString,
            dt: weatherDTO.current.dt,
            sunrise: weatherDTO.current.sunrise,
            sunset: weatherDTO.current.sunset,
            temp: weatherDTO.current.temp,
            feelsLike: weatherDTO.current.feelsLike,
            pressure: weatherDTO.current.pressure,
            humidity: weatherDTO.current.humidity,
            dewPoint: weatherDTO.current.dewPoint ?? 0,
            uvi: weatherDTO.current.uvi ?? 0,
            clouds: weatherDTO.current.clouds ?? 0,
            visibility: weatherDTO.current.visibility ?? 0,
            windSpeed: weatherDTO.current.windSpeed ?? 0,
            windDeg: weatherDTO.current.windDeg ?? 0,
            weather: weatherDTO.current.weather.map { WeatherElement(id: $0.id, main: Main(rawValue: $0.main) ?? .clear, description: Description(rawValue: $0.description) ?? .clearSky, icon: $0.icon) }
        )

        let hourly = weatherDTO.hourly.map { hourlyDTO in
            return Hourly(
                id: UUID().uuidString,
                dt: hourlyDTO.dt,
                sunrise: hourlyDTO.sunrise,
                sunset: hourlyDTO.sunset,
                temp: hourlyDTO.temp,
                feelsLike: hourlyDTO.feelsLike,
                pressure: hourlyDTO.pressure,
                humidity: hourlyDTO.humidity,
                dewPoint: hourlyDTO.dewPoint,
                uvi: hourlyDTO.uvi,
                clouds: hourlyDTO.clouds,
                visibility: hourlyDTO.visibility,
                windSpeed: hourlyDTO.windSpeed,
                windDeg: hourlyDTO.windDeg,
                weather: hourlyDTO.weather.map { WeatherElement(id: $0.id, main: Main(rawValue: $0.main) ?? .clear, description: Description(rawValue: $0.description) ?? .clearSky, icon: $0.icon) },
                windGust: hourlyDTO.windGust,
                rain: Rain(the1H: hourlyDTO.rain?.the1H ?? 0.00)
            )
        }

        let daily = weatherDTO.daily.map { dailyDTO in
            return Daily(
                id: UUID().uuidString,
                dt: dailyDTO.dt,
                sunrise: dailyDTO.sunrise,
                sunset: dailyDTO.sunset,
                moonrise: dailyDTO.moonrise,
                moonset: dailyDTO.moonset,
                moonPhase: dailyDTO.moonPhase,
                summary: dailyDTO.summary,
                temp: Temp(day: dailyDTO.temp.day, min: dailyDTO.temp.min, max: dailyDTO.temp.max, night: dailyDTO.temp.night, eve: dailyDTO.temp.eve, morn: dailyDTO.temp.morn),
                feelsLike: dailyDTO.feelsLike != nil ? FeelsLike(day: dailyDTO.feelsLike!.day, night: dailyDTO.feelsLike!.night, eve: dailyDTO.feelsLike!.eve, morn: dailyDTO.feelsLike!.morn) : nil,
                pressure: dailyDTO.pressure,
                humidity: dailyDTO.humidity,
                dewPoint: dailyDTO.dewPoint,
                windSpeed: dailyDTO.windSpeed,
                windDeg: dailyDTO.windDeg,
                windGust: dailyDTO.windGust,
                weather: dailyDTO.weather.map { WeatherElement(id: $0.id, main: Main(rawValue: $0.main) ?? .clear, description: Description(rawValue: $0.description) ?? .clearSky, icon: $0.icon) },
                clouds: dailyDTO.clouds,
                pop: dailyDTO.pop,
                uvi: dailyDTO.uvi,
                rain: dailyDTO.rain
            )
        }

        return Weather(
            lat: weatherDTO.lat,
            lon: weatherDTO.lon,
            timezone: weatherDTO.timezone,
            timezoneOffset: weatherDTO.timezoneOffset,
            current: current,
            minutely: [],
            hourly: hourly,
            daily: daily
        )
    }

}
