//
//  ContentView.swift
//  CountDownTimerApp
//
//  Created by Ferdos Nurhusien on 2025-03-16.
//  Author: Ferdos Nurhusien, Student ID: 101401294
//
// Changes:
// Edited by: Kate, Student ID: 101413112 - Enhanced splash screen transition with a smoother animation

import SwiftUI

// SplashScreen View displays an initial screen before transitioning to the main HomeScreen
struct SplashScreen: View {
    @State private var isActive = false // State variable to control the splash screen visibility

    var body: some View {
        VStack {
            if isActive {
                // Main HomeScreen is displayed after the splash screen
                HomeScreen()
            } else {
                // Splash screen content
                VStack {
                    Image(systemName: "clock.fill") // Clock icon representing the timer functionality
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    Text("Countdown Timer App") // Title for the splash screen
                        .font(.title)
                        .fontWeight(.bold)
                }
                .onAppear {
                    // Delayed transition to the main screen after 2 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isActive = true // Switch to the main HomeScreen
                        }
                    }
                }
            }
        }
    }
}
