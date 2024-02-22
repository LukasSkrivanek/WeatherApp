//
//  WeatherHoursTileView.swift
//  WeatherApp
//
//  Created by macbook on 22.01.2024.
//

import SwiftUI

struct WeatherHoursTileView: View {
    var hour: String
    var temperature: String
    var imageName: String
    var body: some View {
        VStack(spacing: 15){
            Text(hour)
                .foregroundStyle(.whiteFond)
                .font(.subheadline)
                .bold()
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .font(.title3)
             
            Text("\(temperature)°")
                .foregroundStyle(.whiteFond)
                .font(.subheadline)
                .bold()
        }
    }
}

#Preview {
    WeatherHoursTileView(hour: "10", temperature: "20", imageName: "sun.dust")
}
