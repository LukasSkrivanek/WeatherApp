//
//  HoursWeatherView.swift
//  WeatherApp
//
//  Created by macbook on 22.01.2024.
//

import SwiftUI

struct HoursWeatherView: View {
    let weatherData: Weather
    var body: some View {
        VStack {
            VStack(spacing: 0){
                Text("My Location")
                    .font(.headline)
                Text("\(Int(weatherData.current.temp) )")
                    .font(.title)
                    .bold()
                Text("\(weatherData.current.weather[0].description.rawValue)")
                    .padding(.bottom)
            }
            .foregroundStyle(.whiteFond)
            VStack{
                Text(weatherData.daily.first?.summary ?? "")
                    .padding(.top, 15)
                    .foregroundStyle(.whiteFond)
                Divider()
                    .bold()
                    .background(.whiteFond)
                    .padding(.horizontal, 30)
                    .padding(.top, 8)        
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack(spacing: 20){
                        ForEach(weatherData.hourly.prefix(24), id: \.id) {hourlyClosure in
                            let weatherCondition = Description(rawValue: hourlyClosure.weather[0].description.rawValue)
                            let imageName = weatherCondition?.systemImageName ?? "sun.dust"
                            WeatherHoursTileView(hour: String(hourlyClosure.displayTime),temperature: String(Int(hourlyClosure.temp)), imageName: imageName )
                        }
                    }
                    .padding(.leading, 8)
                }
                .padding()
            }
            .background{
                RoundedRectangle(cornerRadius: 15)
                    .padding(.horizontal)
                    .foregroundStyle(.backgroundRectangle)
            }
        }
        
    }
    
}
