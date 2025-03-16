//
//  TimerInputScreen.swift
//  CountDownTimerApp
//
//  Created by Ferdos Nurhusien on 2025-03-16.
//
import SwiftUI

struct TimerInputScreen: View {
    @Binding var timeRemaining: Int
    @Environment(\.dismiss) var dismiss
    @State private var hours = 0
    @State private var minutes = 0
    @State private var seconds = 0
    
    var body: some View {
        VStack {
            Text("Set Timer")
                .font(.title)
                .padding()
            
            HStack {
                Picker("Hours", selection: $hours) {
                    ForEach(0..<24) { Text("\($0) h") }
                }
                Picker("Minutes", selection: $minutes) {
                    ForEach(0..<60) { Text("\($0) m") }
                }
                Picker("Seconds", selection: $seconds) {
                    ForEach(0..<60) { Text("\($0) s") }
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(height: 150)
            
            Button("Set Timer") {
                timeRemaining = (hours * 3600) + (minutes * 60) + seconds
                dismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}
