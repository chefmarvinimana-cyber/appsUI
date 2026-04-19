//
//  SettingsView.swift
//  appsUI
//
//  Created by Mar Vin on 18/04/2026.
//

import SwiftUI

struct SettingsView: View {
    // These bindings will be passed in from our root view.
    @Binding var currentTheme: Theme
    @Binding var isLoggedIn: Bool

    // An array of all available themes
    private let themes: [Theme] = [.defaultTheme, .neonDark, .cyberGlow]

    var body: some View {
        ZStack {
            currentTheme.backgroundColor.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 30) {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(currentTheme.primaryColor)

                // Theme switching toggle
                HStack {
                    Text("Neon Dark Mode")
                        .font(.headline)
                        .foregroundColor(currentTheme.primaryColor)
                    Spacer()
                    Toggle("Neon Dark Mode", isOn: $isDarkMode)
                        .labelsHidden()
                        .tint(currentTheme.accentColor) // This styles the toggle
                        .onChange(of: isDarkMode) { _, newValue in
                            // When the toggle changes, update the app's theme
                            currentTheme = newValue ? .neonDark : .defaultTheme
                        }
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(15)

                Spacer()

                // Logout Button
                Button(action: {
                    withAnimation {
                        isLoggedIn = false
                    }
                }) {
                    Text("Log Out")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .shadow(color: .red, radius: 5)
            }
            .padding()
        }
    }
}

// A preview wrapper to make it easy to test the view
#Preview {
    // We use .constant for the preview because there's no root view to provide the real state
    SettingsView(currentTheme: .constant(Theme.neonDark), isLoggedIn: .constant(true))
}