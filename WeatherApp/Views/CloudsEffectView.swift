//
//  CloudsEffectView.swift
//  WeatherApp
//
//  Created by Your Future on 10/01/25.
//

import SwiftUI

struct CloudsEffectView: View {
    @State private var clouds: [Cloud] = []
    @State private var offset: CGFloat = 0
    private let cloudSpeed: Double = 8.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // First set of clouds
                CloudGroup(clouds: clouds, offset: offset)
                // Duplicate set of clouds for seamless loop
                CloudGroup(clouds: clouds, offset: offset + geometry.size.width)
            }
            .onAppear {
                createClouds(in: geometry.size)
                animateClouds(for: geometry.size.width)
            }
        }
    }
    
    private func createClouds(in size: CGSize) {
        clouds = (0..<12).map { _ in
            Cloud(
                x: CGFloat.random(in: 0...size.width),
                y: CGFloat.random(in: 50...size.height/2),
                size: CGFloat.random(in: 100...200),
                opacity: Double.random(in: 0.5...0.8)
            )
        }
    }
    
    private func animateClouds(for width: CGFloat) {
        withAnimation(.linear(duration: 0)) {
            offset = 0
        }
        
        withAnimation(
            .linear(duration: cloudSpeed)
            .repeatForever(autoreverses: false)
        ) {
            offset = -width
        }
    }
}

#Preview {
    CloudsEffectView()
}
