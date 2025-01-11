//
//  DaySkyEffectView.swift
//  WeatherApp
//
//  Created by Your Future on 10/01/25.
//

import SwiftUI

struct DaySkyEffectView: View {
    var body: some View {
        ZStack {
            // Base sky gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.95, green: 0.6, blue: 0.3),
                    Color(red: 0.98, green: 0.8, blue: 0.5),
                    Color(red: 0.7, green: 0.9, blue: 1.0)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Sun
            Circle()
                .fill(Color(red: 1.0, green: 0.8, blue: 0.3))
                .frame(width: 100, height: 100)
                .position(x: UIScreen.main.bounds.width - 80, y: 80)
                .blur(radius: 20)
                .opacity(0.8)
        }
    }
}

#Preview {
    DaySkyEffectView()
}
