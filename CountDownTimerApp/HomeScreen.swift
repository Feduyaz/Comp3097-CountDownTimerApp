import SwiftUI
import UserNotifications

// File: HomeScreen.swift
// Author: Ferdos Nurhusien, Student ID: 101401294, Date: 2025-04-07
//
// Changes:
// Edited by: Kate, Student ID: 101413112 - Modified button layout and added animations

struct HomeScreen: View {
    @State private var showTimerInput = false // State to control timer input view visibility
    @State private var timeRemaining = 0 // State to store the remaining time for the timer
    @State private var timer: Timer? = nil // State to hold the timer object
    @State private var isRunning = false // State to track if the timer is running
    @State private var showAlert = false // State to trigger alert when time is up

    var body: some View {
        VStack {
            // Timer Icon and Title Section
            VStack {
                Image(systemName: "clock.fill") // Timer icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding(.top, 50)
                    .foregroundColor(.accentColor) // Accent color for the icon
                Text("Countdown Timer") // Title text
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 8)
                    .foregroundColor(.primary) // Primary color for text
            }

            // Time Display Section
            Text(timeString(time: timeRemaining)) // Display the remaining time
                .font(.system(size: 72, weight: .bold, design: .rounded)) // Large, bold font for time
                .foregroundColor(timeRemaining <= 0 ? .red : .primary) // Red if time is up
                .padding(.top, 40)
                .padding(.bottom, 30)

            // Set Timer Button Section
            Button("Set Timer") {
                showTimerInput = true // Show timer input view when tapped
            }
            .font(.title2)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue) // Blue background for the button
            .foregroundColor(.white) // White text color
            .cornerRadius(10)
            .padding(.horizontal, 40) // Horizontal padding for the button
            .sheet(isPresented: $showTimerInput) {
                TimerInputScreen(timeRemaining: $timeRemaining) // Navigate to timer input screen
            }

            // Timer Control Buttons (Only shown when timeRemaining > 0)
            if timeRemaining > 0 {
                HStack(spacing: 30) {
                    Button(isRunning ? "Pause" : "Start Timer") {
                        if isRunning {
                            pauseTimer() // Pause the timer
                        } else {
                            startTimer() // Start the timer
                        }
                    }
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isRunning ? Color.orange : Color.green) // Orange if running, green if not
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    Button("Reset") {
                        resetTimer() // Reset the timer
                    }
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red) // Red background for reset button
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.top, 20)
            }
        }
        .padding()
        .alert("Time's Up!", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Your countdown has ended.") // Alert message when the time ends
        }
        .navigationBarBackButtonHidden(true) // Hide the back button on the navigation bar
        .onAppear {
            // Request notification permissions when the screen appears
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
                if let error = error {
                    print("Permission error: \(error.localizedDescription)") // Handle permission error
                }
            }
        }
    }

    // Timer logic functions
    func startTimer() {
        isRunning = true // Set timer status to running
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1 // Decrement time every second
            } else {
                stopTimer() // Stop the timer when time is up
                showAlert = true // Show the alert when time is up
                triggerNotification() // Trigger the notification when time is up
            }
        }
    }

    func pauseTimer() {
        isRunning = false // Set timer status to paused
        timer?.invalidate() // Invalidate the timer to stop it
    }

    func resetTimer() {
        isRunning = false // Set timer status to not running
        timer?.invalidate() // Invalidate the timer
        timeRemaining = 0 // Reset the time remaining to 0
    }

    func stopTimer() {
        isRunning = false // Set timer status to not running
        timer?.invalidate() // Invalidate the timer
        timer = nil // Reset the timer object to nil
    }

    func triggerNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Time’s Up!" // Notification title
        content.body = "Your countdown has ended." // Notification body
        content.sound = .default // Default notification sound

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) // Add the notification request to the notification center
    }

    // Convert time remaining to a formatted string (HH:mm:ss)
    func timeString(time: Int) -> String {
        let hours = time / 3600 // Calculate hours
        let minutes = (time % 3600) / 60 // Calculate minutes
        let seconds = time % 60 // Calculate seconds
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds) // Return the formatted time
    }
}
