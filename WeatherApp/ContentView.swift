//
//  ContentView.swift
//  WeatherApp
//
//  Created by Your Future on 07/01/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            // Background based on day/night
            if viewModel.isDaytime {
                DaySkyEffectView() // Custom view for daytime background
            } else {
                NightSkyEffectView() // Custom view for nighttime background
            }
            
            // Weather Effects
            if viewModel.condition == .snow {
                SnowEffectView()
                    .ignoresSafeArea()
            } else if viewModel.condition == .rain {
                RainEffectView()
                    .ignoresSafeArea()
            } else if viewModel.condition == .cloudy {
                CloudsEffectView()
                    .opacity(0.9)
                    .ignoresSafeArea()
            } else if viewModel.condition == .clear {
                EmptyView()
            }
            
            // Weather Information
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(viewModel.weatherResponse?.name ?? "Unknown")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Text(String(format: "%.2f", (viewModel.weatherResponse?.main.temp ?? 0.0)))
                            .font(.system(size: 90, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .padding()
                    .multilineTextAlignment(.center)
                    
                    Text(viewModel.weatherResponse?.weather.first?.description.capitalized ?? "Weather Unavailable")
                        .rotationEffect(.degrees(-90))
                        .foregroundColor(.white)
                        .padding(.leading)
                }
                
                Spacer()
                
                HStack(spacing: 50) {
                    VStack {
                        Text(String(format: "%.2f", viewModel.weatherResponse?.main.humidity ?? 0))
                            .foregroundStyle(Color.white)
                            .font(.system(size: 18, weight: .bold))
                        Text("Humidity")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 14, weight: .light))
                    }
                    
                    VStack {
                        Text(String(format: "%.2f", (viewModel.weatherResponse?.visibility ?? 0.0) / 1000))
                            .foregroundStyle(Color.white)
                            .font(.system(size: 18, weight: .bold))
                        Text("Visibility")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 14, weight: .light))
                    }
                    
                    VStack {
                        Text(String(format: "%.2f", (viewModel.weatherResponse?.wind.speed ?? 0.0)))
                            .foregroundStyle(Color.white)
                            .font(.system(size: 18, weight: .bold))
                        Text("Wind")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 14, weight: .light))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 1)
                )
                .padding()
            }
        }
        .onAppear {
            viewModel.requestLocationAccess()
        }
    }
}

#Preview {
    ContentView()
}
