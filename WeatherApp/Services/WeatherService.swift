//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Your Future on 10/01/25.
//

import Foundation
import Combine

class WeatherService {
    private let apiKey = "ea0d28a11e2124a89d4870e893f4ee6e" // change with your custom API.
    
    func fetchWeather(lat: Double, lon: Double) -> AnyPublisher<WeatherResponse, Error> {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&units=metric&appid=\(apiKey)"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
