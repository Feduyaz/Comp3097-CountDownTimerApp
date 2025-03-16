//
//  Helpers.swift
//  CountDownTimerApp
//
//  Created by Suher Nurhusien on 2025-03-16.
//

// Helper Functions
func parseTime(_ input: String) -> Int? {
    let components = input.split(separator: ":").compactMap { Int($0) }
    guard components.count == 3 else { return nil }
    return components[0] * 3600 + components[1] * 60 + components[2]
}

func formatTime(seconds: Int) -> String {
    let hours = seconds / 3600
    let minutes = (seconds % 3600) / 60
    let seconds = seconds % 60
    return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
}

func playSound() {
    AudioServicesPlaySystemSound(1304) // Default system sound
}

@main
struct CountdownTimerApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}
