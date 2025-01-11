//
//  RainEffectView.swift
//  WeatherApp
//
//  Created by Your Future on 10/01/25.
//

import SwiftUI

struct RainEffectView: View {
    @State private var raindrops = [Raindrop]()
    private let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            ForEach(raindrops) { drop in
                RaindropShape()
                    .fill(Color.white.opacity(0.85))
                    .frame(width: drop.width, height: drop.height)
                    .position(x: drop.x, y: drop.y)
                    .rotationEffect(.degrees(20))
                    .animation(.linear(duration: drop.speed), value: drop.y)
            }
        }
        .onReceive(timer) { _ in
            addRaindrop()
            updateRaindrops()
        }
    }

    private func addRaindrop() {
        for _ in 0...2 {
            let newRaindrop = Raindrop(
                id: UUID(),
                x: CGFloat.random(in: -20...UIScreen.main.bounds.width + 20),
                y: -20,
                width: CGFloat.random(in: 1...2),
                height: CGFloat.random(in: 8...15),
                speed: Double.random(in: 0.15...0.25)
            )
            raindrops.append(newRaindrop)
        }
    }

    private func updateRaindrops() {
        for i in (0..<raindrops.count).reversed() {
            raindrops[i].y += CGFloat(raindrops[i].speed * 200)
            raindrops[i].x += 2
            if raindrops[i].y > UIScreen.main.bounds.height + 20 {
                raindrops.remove(at: i)
            }
        }
    }
}

#Preview {
    RainEffectView()
}
