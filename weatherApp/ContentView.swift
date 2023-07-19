//
//  ContentView.swift
//  weatherApp
//
//  Created by David Grammatico on 17/07/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationHandler()
    @StateObject var api = APIHAndler()
    var body: some View {
        NavigationStack {
            VStack(content: {
                if api.forecasts.count > 0 {
                    CurrentForecastView(forecast: api.forecasts[0])
                        .background(.mint.opacity(0.2))
                        .cornerRadius(25)
                        .padding()
                }
                ForecastListView(forecasts: api.forecasts)
            })
                .navigationTitle(locationManager.cityName ?? "Ma météo")
                .onChange(of: locationManager.cityName) { newValue in
                    api.callApi(lat: locationManager.latitude, lon: locationManager.longitude)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
