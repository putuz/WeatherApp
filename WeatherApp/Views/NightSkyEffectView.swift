//
//  NightSkyEffectView.swift
//  WeatherApp
//
//  Created by Your Future on 10/01/25.
//

import SwiftUI

struct NightSkyEffectView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color.blue]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // Stars
            ForEach(0..<100, id: \.self) { _ in
                Circle()
                    .fill(Color.yellow.opacity(0.8))
                    .frame(width: CGFloat.random(in: 2...4))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
            }
        }
    }
}

#Preview {
    NightSkyEffectView()
}
