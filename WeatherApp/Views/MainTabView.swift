//
//  MainTabView.swift
//  WeatherApp
//
//  Created by macbook on 11.02.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MainView(vm: ContentViewModel())
                .tabItem {
                    Image(systemName: "thermometer.sun.circle")
                
                }

            Text("Druhá stránka")
                .tabItem {
                    Image(systemName: "2.square.fill")
                 
                }
        }
    }
}

#Preview {
    MainTabView()
}
