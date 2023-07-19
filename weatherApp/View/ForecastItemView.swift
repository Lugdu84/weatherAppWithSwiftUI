//
//  ForecastItemView.swift
//  weatherApp
//
//  Created by David Grammatico on 19/07/2023.
//

import SwiftUI

struct ForecastItemView: View {
    var forecast: Forecast
    @StateObject var imageHandler = ImageHandler()
    var body: some View {
        HStack {
            imageHandler.image
                .resizable()
                .frame(width: 45, height: 45)
            Spacer()
            VStack {
                Text(DateHandler().fromTimestampToString(forecast.dt))
                    .font(.caption)
                Text(forecast.weather.first!.description)
                    .font(.caption)
                    .italic()
                    .foregroundColor(.secondary)
            }
            Text("\(Int(forecast.main.temp)) °C")
                .foregroundColor(.indigo)
                .bold()
        }.onAppear() {
            imageHandler.download(icon: forecast.weather.first!.icon)
        }
    }
}
