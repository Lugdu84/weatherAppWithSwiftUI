//
//  ApiResult.swift
//  weatherApp
//
//  Created by David Grammatico on 17/07/2023.
//

import Foundation

struct ApiResult: Decodable {
    var list: [Forecast]
}

struct Forecast: Decodable {
    var dt: Int
    var main: Main
    var weather: [Weather]
    var clouds: Clouds
    var wind: Wind
    var visibility: Int
    var dt_txt: String
}

struct Main: Decodable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Int
    var sea_level: Int
    var grnd_level: Int
    var humidity: Int
    var temp_kf: Double
}

struct Weather: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Clouds: Decodable {
    var all: Int
}

struct Wind: Decodable {
    var speed: Double
    var deg: Int
    var gust: Double
}
