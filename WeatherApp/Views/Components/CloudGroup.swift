//
//  CloudGroup.swift
//  WeatherApp
//
//  Created by Your Future on 10/01/25.
//

import SwiftUI

struct CloudGroup: View {
    let clouds: [Cloud]
    let offset: CGFloat
    
    var body: some View {
        ZStack {
            ForEach(clouds) { cloud in
                CloudShape()
                    .fill(Color.white.opacity(cloud.opacity))
                    .frame(width: cloud.size, height: cloud.size/2)
                    .position(x: cloud.x + offset, y: cloud.y)
                    .blur(radius: 8)
            }
        }
    }
}

#Preview {
    let exampleClouds = [
        Cloud(x: 50, y: 100, size: 150, opacity: 0.8),
        Cloud(x: 200, y: 150, size: 120, opacity: 0.6),
        Cloud(x: 300, y: 200, size: 100, opacity: 0.7)
    ]
    return CloudGroup(clouds: exampleClouds, offset: 0)
        .background(.blue)
}

