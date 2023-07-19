//
//  ForecastListView.swift
//  weatherApp
//
//  Created by David Grammatico on 19/07/2023.
//

import SwiftUI

struct ForecastListView: View {
    var forecasts: [Forecast]
    var body: some View {
        List(forecasts, id: \.dt) { forecast in
           ForecastItemView(forecast: forecast)
        }.listStyle(.plain)
    }
}
