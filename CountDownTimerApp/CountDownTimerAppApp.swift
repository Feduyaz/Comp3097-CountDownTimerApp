//
//  CountDownTimerAppApp.swift
//  CountDownTimerApp
//
//  Created by Ferdos Nurhusien on 2025-03-16.
//

import SwiftUI
import UserNotifications

@main
struct CountdownTimerApp: App {
    init() {
        // Request notification permission on app launch
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { _, _ in }
    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}
