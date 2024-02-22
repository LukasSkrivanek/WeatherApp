//
//  ContentView.swift
//  WeatherApp
//
//  Created by macbook on 22.01.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm : ContentViewModel
    
    init(vm: ContentViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }
    var body: some View {
        VStack {
            if let weatherData = vm.weatherLoaded {
                HoursWeatherView(weatherData: weatherData)
                    .opacity(0.7)
                    .padding(.bottom, 20)
            }
            if let wetherData = vm.weatherLoaded {
                DailyWeatherView(weatherData: wetherData)
                    .opacity(0.7)
                    .padding(.horizontal)
            }
        }
        .background{
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.background, .backgroundRectangle]), startPoint: .top, endPoint: .bottom))
        }
    }
}

#Preview {
    MainView(vm: ContentViewModel())
}

