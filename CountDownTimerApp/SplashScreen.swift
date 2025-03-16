//
//  ContentView.swift
//  CountDownTimerApp
//
//  Created by Ferdos Nurhusien on 2025-03-16.
import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    
    var body: some View {
        VStack {
            if isActive {
                HomeScreen()
            } else {
                VStack {
                    Image(systemName: "clock.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    Text("Countdown Timer App")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isActive = true
                    }
                }
            }
        }
    }
}
