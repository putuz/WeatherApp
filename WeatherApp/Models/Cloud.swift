//
//  Cloud.swift
//  WeatherApp
//
//  Created by Your Future on 10/01/25.
//

import Foundation

struct Cloud: Identifiable {
    let id = UUID()
    let x: CGFloat
    let y: CGFloat
    let size: CGFloat
    let opacity: Double
}
