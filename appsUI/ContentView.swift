//
//  ContentView.swift
//  appsUI
//
//  Created by Mar Vin on 18/04/2026.
//

import SwiftUI

struct ContentView: View {
    // The single source of truth for the entire app's state
    @State private var currentTheme: Theme = .neonDark
    @State private var isLoggedIn: Bool = false

    var body: some View {
        // Use a ZStack to allow for smooth transitions
        ZStack {
            if isLoggedIn {
                // If logged in, show the main tabbed view
                MainView(currentTheme: $currentTheme, isLoggedIn: $isLoggedIn)
                    .transition(.asymmetric(insertion: .opacity.animation(.easeIn(duration: 0.5)), removal: .opacity.animation(.easeOut(duration: 0.2))))
            } else {
                // If not logged in, show the login view
                LoginView(currentTheme: $currentTheme, isLoggedIn: $isLoggedIn)
            }
        }
        // This ensures the status bar text (time, battery) is visible on our dark theme
        .preferredColorScheme(currentTheme.primaryColor == .white ? .dark : .light)
    }
}

#Preview {
    ContentView()
}
