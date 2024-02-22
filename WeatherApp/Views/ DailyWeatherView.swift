//
//  DailyWeatherView.swift
//  WeatherApp
//
//  Created by macbook on 22.01.2024.
//

import SwiftUI

struct DailyWeatherView: View {
    var weatherData: Weather
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            HStack(spacing: 10){
                Image(systemName: L10n.calendar)
                Text(L10n.days)
            }
            .padding(.top, 10)
            .foregroundStyle(.whiteFond)
            Divider()
                .bold()
                .background(.whiteFond)
                .padding(.horizontal, 10)
                .padding(.top, 8)

            ScrollView(showsIndicators: false){
                VStack(spacing: 15){
                    ForEach(weatherData.daily, id: \.id){dailyDataClosure in
                        let weatherCondition = Description(rawValue: dailyDataClosure.weather[0].description.rawValue)
                        let imageName = weatherCondition?.systemImageName ?? "sun.dust"
                        DailyTileView(day: dailyDataClosure.displayDay, imageName: imageName ,lowestTemperature: dailyDataClosure.temp.min, highestTemperature: dailyDataClosure.temp.max)
                    }
                }
            }

        }
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.backgroundRectangle)
        }
        
    }
}

