//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Your Future on 10/01/25.
//

import Foundation
import Combine
import CoreLocation

class WeatherViewModel: ObservableObject {
    @Published var weatherResponse: WeatherResponse?
    @Published var condition: WeatherCondition = .clear
    
    private var cancellables = Set<AnyCancellable>()
    private let weatherService = WeatherService()
    let locationManager = LocationManager()
    
    // Computed property to determine whether it is daytime
    var isDaytime: Bool {
        let currentHour = Calendar.current.component(.hour, from: Date())
        return currentHour >= 6 && currentHour < 18  // Daytime is 6 AM to 6 PM
    }
    
    init() {
        requestLocationAccess()
    }
    
    func fetchWeather(lat: Double, lon: Double) {
            weatherService.fetchWeather(lat: lat, lon: lon)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        print("Error fetching weather: \(error)")
                    case .finished:
                        break
                    }
                }, receiveValue: { [weak self] weatherResponse in
                    guard let self = self else { return }
                    self.weatherResponse = weatherResponse
                    
                    // Update weather condition
                    if let weatherMain = weatherResponse.weather.first?.main {
                        self.condition = WeatherCondition(from: weatherMain)
                    } else {
                        self.condition = .clear
                    }
                })
                .store(in: &cancellables)
        }
    
    func requestLocationAccess() {
        locationManager.checkLocationAuthorization()
        // If location is granted, fetch weather data
        if let location = locationManager.currentLocation {
            fetchWeather(lat: location.latitude, lon: location.longitude)
        }
    }
}
