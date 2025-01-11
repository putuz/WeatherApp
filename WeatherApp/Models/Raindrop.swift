//
//  Raindrop.swift
//  WeatherApp
//
//  Created by Your Future on 10/01/25.
//

import Foundation

struct Raindrop: Identifiable {
    let id: UUID
    var x: CGFloat
    var y: CGFloat
    let width: CGFloat
    let height: CGFloat
    let speed: Double
}
