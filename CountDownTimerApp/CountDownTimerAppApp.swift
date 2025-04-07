//
//  CountDownTimerAppApp.swift
//  CountDownTimerApp
//
//  Created by Ferdos Nurhusien on 2025-03-16.
//  Author: Ferdos Nurhusien, Student ID: 101401294
//
// Changes:
// Edited by: Kate, Student ID: 101413112 - Improved comment structure and added handling for notification permissions

import SwiftUI
import UserNotifications

// Main entry point of the app
@main
struct CountdownTimerApp: App {
    // Initializer for the app, requests notification permission on app launch
    init() {
        // Request notification permission for alerts and sounds
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { success, error in
            if let error = error {
                print("Notification permission error: \(error.localizedDescription)") // Log any error
            } else if success {
                print("Notification permission granted.") // Log success
            }
        }
    }
    
    var body: some Scene {
        // WindowGroup to launch the SplashScreen initially
        WindowGroup {
            SplashScreen() // The initial splash screen is shown when the app starts
        }
    }
}
