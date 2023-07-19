//
//  ImageHandler.swift
//  weatherApp
//
//  Created by David Grammatico on 19/07/2023.
//

import Foundation
import SwiftUI


class ImageHandler : ObservableObject {
    @Published var image = Image(systemName: "sunset.circle.fill")
    let base = "http://openweathermap.org/img/wn/"
    let suffix = "@2x.png"
    
    func download(icon: String) {
        let urlString = "\(base)\(icon)\(suffix)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func completion(_ data: Data?, _ response: URLResponse?, _ error: Error?) {
        DispatchQueue.main.async {
            guard let data = data else {return }
            guard let uiImage = UIImage(data: data) else { return }
            self.image = Image(uiImage: uiImage)
        }
    }
}
