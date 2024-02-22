//
//  DailyTileView.swift
//  WeatherApp
//
//  Created by macbook on 08.02.2024.
//

import SwiftUI

struct DailyTileView: View {
    var day: String
    var imageName: String
    var lowestTemperature: Double
    var highestTemperature: Double
    var body: some View {
        HStack{
                Text(day)
                    .frame(width: 80, alignment: .leading)
                    .foregroundColor(.white)
                    .padding(.leading, 8)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .frame(width: 20)
                .padding(.leading, 50)
            Spacer()
            
            Text("\(String(Int(lowestTemperature)))° / \(String(Int(highestTemperature)))°")
                .foregroundStyle(.whiteFond)
                .padding([.horizontal], 8)
        }
    }
}

#Preview {
    DailyTileView(day: "Pondělí", imageName: "sun.max.fill", lowestTemperature: 10.0, highestTemperature: 20)
}
