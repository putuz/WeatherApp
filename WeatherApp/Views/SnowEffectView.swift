//
//  SnowEffectView.swift
//  WeatherApp
//
//  Created by Your Future on 10/01/25.
//

import SwiftUI

struct SnowEffectView: View {
    @State private var snowflakes = [Snowflake]()
    private let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            ForEach(snowflakes) { snowflake in
                Circle()
                    .fill(Color.white.opacity(0.8))
                    .frame(width: snowflake.size, height: snowflake.size)
                    .position(x: snowflake.x, y: snowflake.y)
                    .animation(.linear(duration: snowflake.speed), value: snowflake.y)
            }
        }
        .onReceive(timer) { _ in
            addSnowflake()
            updateSnowflakes()
        }
    }

    private func addSnowflake() {
        let newSnowflake = Snowflake(
            id: UUID(),
            x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
            y: -10,
            size: CGFloat.random(in: 3...8),
            speed: Double.random(in: 3...7)
        )
        snowflakes.append(newSnowflake)
    }

    private func updateSnowflakes() {
        for i in (0..<snowflakes.count).reversed() {
            snowflakes[i].y += CGFloat(snowflakes[i].speed * 5)
            if snowflakes[i].y > UIScreen.main.bounds.height {
                snowflakes.remove(at: i)
            }
        }
    }
}

#Preview {
    SnowEffectView()
}
