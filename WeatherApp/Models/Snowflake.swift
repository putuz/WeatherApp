//
//  Snowflake.swift
//  WeatherApp
//
//  Created by Your Future on 10/01/25.
//

import Foundation

struct Snowflake: Identifiable {
    let id: UUID
    var x: CGFloat
    var y: CGFloat
    let size: CGFloat
    let speed: Double
}
