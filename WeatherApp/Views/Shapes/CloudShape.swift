//
//  CloudShape.swift
//  WeatherApp
//
//  Created by Your Future on 10/01/25.
//

import SwiftUI

struct CloudShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Base circle
        path.move(to: CGPoint(x: rect.minX + rect.width * 0.2, y: rect.midY))
        
        // Bottom curve
        path.addCurve(
            to: CGPoint(x: rect.maxX - rect.width * 0.2, y: rect.midY),
            control1: CGPoint(x: rect.width * 0.4, y: rect.maxY),
            control2: CGPoint(x: rect.width * 0.6, y: rect.maxY)
        )
        
        // Right curve
        path.addCurve(
            to: CGPoint(x: rect.maxX - rect.width * 0.2, y: rect.midY * 0.7),
            control1: CGPoint(x: rect.maxX, y: rect.midY),
            control2: CGPoint(x: rect.maxX, y: rect.midY * 0.7)
        )
        
        // Top curve
        path.addCurve(
            to: CGPoint(x: rect.minX + rect.width * 0.2, y: rect.midY * 0.7),
            control1: CGPoint(x: rect.width * 0.6, y: rect.minY),
            control2: CGPoint(x: rect.width * 0.4, y: rect.minY)
        )
        
        // Left curve
        path.addCurve(
            to: CGPoint(x: rect.minX + rect.width * 0.2, y: rect.midY),
            control1: CGPoint(x: rect.minX, y: rect.midY * 0.7),
            control2: CGPoint(x: rect.minX, y: rect.midY)
        )
        
        path.closeSubpath()
        return path
    }
}

#Preview {
    CloudShape()
        .stroke(Color.blue, lineWidth: 2)
        .frame(width: 200, height: 100)
}
