import SwiftUI

// File: TimerInputScreen.swift
// Author: Ferdos Nurhusien, Student ID: 101401294, Date: 2025-04-07
//
// Changes:
// Edited by: Kate, Student ID: 101413112 - Enhanced picker styles and added error handling for invalid inputs.

struct TimerInputScreen: View {
    @Binding var timeRemaining: Int // Binding to update the remaining time from the parent view
    @Environment(\.dismiss) var dismiss // Environment variable to dismiss the current view
    @State private var hours = 0 // State variable to store hours input
    @State private var minutes = 0 // State variable to store minutes input
    @State private var seconds = 0 // State variable to store seconds input
    
    var body: some View {
        VStack {
            // Timer Input Title
            Text("Set Timer")
                .font(.title)
                .padding()

            // Time Picker for hours, minutes, and seconds
            HStack {
                Picker("Hours", selection: $hours) {
                    ForEach(0..<24) { Text("\($0) h") } // Picker for hours from 0 to 23
                }
                Picker("Minutes", selection: $minutes) {
                    ForEach(0..<60) { Text("\($0) m") } // Picker for minutes from 0 to 59
                }
                Picker("Seconds", selection: $seconds) {
                    ForEach(0..<60) { Text("\($0) s") } // Picker for seconds from 0 to 59
                }
            }
            .pickerStyle(WheelPickerStyle()) // Wheel picker style for the time inputs
            .frame(height: 150) // Set the height for the picker

            // Set Timer Button
            Button("Set Timer") {
                // Calculate the total time in seconds
                let totalTime = (hours * 3600) + (minutes * 60) + seconds
                if totalTime > 0 {
                    timeRemaining = totalTime // Update the time remaining if valid
                    dismiss() // Dismiss the timer input screen
                } else {
                    // Handle case for invalid time input (e.g., all values are zero)
                    print("Invalid time input")
                }
            }
            .padding()
            .background(Color.blue) // Button background color
            .foregroundColor(.white) // Button text color
            .cornerRadius(10) // Rounded corners for the button
        }
        .padding()
    }
}
