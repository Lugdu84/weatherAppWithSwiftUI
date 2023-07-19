//
//  CurrentForecastView.swift
//  weatherApp
//
//  Created by David Grammatico on 19/07/2023.
//

import SwiftUI

struct CurrentForecastView: View {
    @StateObject var id = ImageHandler()
    var forecast: Forecast
    var body: some View {
        VStack {
            HStack {
                id.image
                    .resizable()
                .frame(width: 125, height: 125)
                Spacer()
                Text("\(Int(forecast.main.temp)) ° C")
                    .font(.title)
                    .foregroundColor(.orange)
                    .bold()
            }
            Text(DateHandler().fromTimestampToString(forecast.dt))
            Text(forecast.weather.first!.description)
                .italic()
                .foregroundColor(.secondary)
        }
        .padding()
        .onAppear() {
            id.download(icon: forecast.weather.first!.icon)
        }
        
    }
}
