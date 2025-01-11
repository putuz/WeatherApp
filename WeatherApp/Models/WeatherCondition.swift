//
//  WeatherCondition.swift
//  WeatherApp
//
//  Created by Your Future on 10/01/25.
//

import Foundation

enum WeatherCondition: String, CaseIterable {
    case snow, rain, clear, cloudy, thunderstorm, drizzle

    init(from rawValue: String) {
        switch rawValue.lowercased() {
        case "snow":
            self = .snow
        case "rain":
            self = .rain
        case "clouds":
            self = .cloudy
        case "thunderstorm":
            self = .thunderstorm
        case "drizzle":
            self = .rain
        default:
            self = .clear
        }
    }
}

