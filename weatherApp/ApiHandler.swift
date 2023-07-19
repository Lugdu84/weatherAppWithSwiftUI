//
//  ApiHandler.swift
//  weatherApp
//
//  Created by David Grammatico on 17/07/2023.
//

import Foundation

class APIHAndler: ObservableObject {
    
    @Published var forecasts: [Forecast] = []
    
    func callApi(lat: Double, lon: Double) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&units=metric&lang=fr&appid=\(Secrets.API_KEY)"
        guard let url = URL(string: urlString) else { return }
        print(url)
        URLSession.shared.dataTask(with: url, completionHandler: completionHandler).resume()
    }
    
    func completionHandler(data: Data?, urlResponse: URLResponse?, error: Error?) {
        DispatchQueue.main.async {
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(ApiResult.self, from: data)
                    self.forecasts = result.list
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
