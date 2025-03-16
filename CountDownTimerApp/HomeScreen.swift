//
//  SplashScreen 2.swift
//  CountDownTimerApp
//
//  Created by Ferdos Nurhusien on 2025-03-16.
//
import SwiftUI
import UserNotifications

struct HomeScreen: View {
    @State private var showTimerInput = false
    @State private var timeRemaining = 0
    @State private var timer: Timer? = nil
    @State private var isRunning = false
    @State private var showAlert = false

    var body: some View {
        VStack {
            Image(systemName: "clock.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()

            Text(timeString(time: timeRemaining))
                .font(.largeTitle)
                .padding()

            Button("Set Timer") {
                showTimerInput = true
            }
            .padding()
            .sheet(isPresented: $showTimerInput) {
                TimerInputScreen(timeRemaining: $timeRemaining)
            }

            if timeRemaining > 0 {
                Button(isRunning ? "Pause" : "Start Timer") {
                    if isRunning {
                        pauseTimer()
                    } else {
                        startTimer()
                    }
                }
                .padding()
                .background(isRunning ? Color.orange : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("Reset") {
                    resetTimer()
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
        .alert("Time's Up!", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Your countdown has ended.")
        }
    }

    func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopTimer()
                showAlert = true
                triggerNotification()
            }
        }
    }

    func pauseTimer() {
        isRunning = false
        timer?.invalidate()
    }

    func resetTimer() {
        isRunning = false
        timer?.invalidate()
        timeRemaining = 0
    }

    func stopTimer() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }

    func triggerNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Time’s Up!"
        content.body = "Your countdown has ended."
        content.sound = .default

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request)
    }

    func timeString(time: Int) -> String {
        let hours = time / 3600
        let minutes = (time % 3600) / 60
        let seconds = time % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
