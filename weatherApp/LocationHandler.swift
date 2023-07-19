//
//  LocationHandler.swift
//  weatherApp
//
//  Created by David Grammatico on 17/07/2023.
//

import SwiftUI
import CoreLocation

class LocationHandler: NSObject, ObservableObject {
    let locationManager = CLLocationManager()
    let geo = CLGeocoder()
    @Published var latitude: Double = 0
    @Published var longitude: Double = 0
    @Published var cityName: String?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func geocode(location: CLLocation) {
        geo.reverseGeocodeLocation(location) { places, error in
            DispatchQueue.main.async {
                if let error = error {
                    print(error.localizedDescription )
                }
                guard let bestMatch = places?.first else { return }
                self.cityName = bestMatch.locality
            }
        }
    }
}


extension LocationHandler : CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {

        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse: locationManager.requestLocation()
            
        default:
            print("Autre cas")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Erreur \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let first = locations.first else { return }
        self.latitude = first.coordinate.latitude
        self.longitude = first.coordinate.longitude
        self.geocode(location: first)
    }
}
