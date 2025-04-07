# ⏱️ CountDownTimerApp

A simple and elegant iOS application that allows users to set, start, pause, and reset a countdown timer with local notification support when the timer ends.

## 📱 Features

- Set custom timer duration using hours, minutes, and seconds.
- Start, pause, and reset the countdown.
- Beautiful and responsive SwiftUI interface.
- Local notifications when the timer reaches zero.
- Splash screen with smooth transition to the main timer interface.

## 🧑‍💻 Author

- **Ferdos Nurhusien**  
  Student ID: `101401294` 
  Created the UI and logic for timer countdown, notification setup, and navigation.

## 👨‍👩‍👧‍👦 Contributors

- **Kate Labis**  
  Student ID: `101413112`  
  Added internal documentation and improved error handling in notification setup.

## 🏗️ Architecture

- **SplashScreen.swift**: Displays the logo and app name before transitioning to the HomeScreen.
- **HomeScreen.swift**: Main screen showing the timer and controls.
- **TimerInputScreen.swift**: Modal sheet for selecting timer duration.
- **CountDownTimerAppApp.swift**: App entry point, handles notification permission.
