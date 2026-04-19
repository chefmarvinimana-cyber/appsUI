//
//  to.swift
//  appsUI
//
//  Created by Mar Vin on 18/04/2026.
//


import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    
    // Receive the shared state from ContentView
    @Binding var currentTheme: Theme
    @Binding var isLoggedIn: Bool

    var body: some View {
        ZStack {
            // Animated background shapes
            Circle().fill(currentTheme.accentColor).blur(radius: 100).offset(x: -150, y: -200)
            Circle().fill(Color.purple).blur(radius: 120).offset(x: 150, y: 150)
            currentTheme.backgroundColor.ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Welcome Back").font(.largeTitle).fontWeight(.bold).foregroundColor(currentTheme.primaryColor).padding(.bottom, 20)
                TextField("Username", text: $username).padding().background(.ultraThinMaterial).foregroundColor(currentTheme.primaryColor).cornerRadius(10).overlay(RoundedRectangle(cornerRadius: 10).stroke(currentTheme.secondaryColor.opacity(0.5), lineWidth: 1)).textInputAutocapitalization(.never).keyboardType(.emailAddress)
                SecureField("Password", text: $password).padding().background(.ultraThinMaterial).foregroundColor(currentTheme.primaryColor).cornerRadius(10).overlay(RoundedRectangle(cornerRadius: 10).stroke(currentTheme.secondaryColor.opacity(0.5), lineWidth: 1))
                Button(action: { print("Forgot Password tapped") }) { Text("Forgot Password?").font(.footnote).foregroundColor(currentTheme.accentColor) }.frame(maxWidth: .infinity, alignment: .trailing).shadow(color: currentTheme.accentColor, radius: 4)
                
                // Updated Login Button
                Button(action: {
                    // On tap, trigger the animation and set isLoggedIn to true
                    withAnimation(.easeIn(duration: 0.5)) {
                        isLoggedIn = true
                    }
                }) {
                    Text("Log In").font(.headline).foregroundColor(.white).frame(maxWidth: .infinity).padding().background(.ultraThinMaterial).cornerRadius(10)
                }
                .shadow(color: currentTheme.accentColor, radius: 8)
                .padding(.top)

                Spacer()
                HStack {
                    Text("Don't have an account?").foregroundColor(currentTheme.secondaryColor)
                    Button(action: { print("Sign Up tapped") }) { Text("Sign Up").fontWeight(.semibold).foregroundColor(currentTheme.accentColor).shadow(color: currentTheme.accentColor, radius: 5) }
                }
            }
            .padding(.horizontal, 30).padding(.vertical)
        }
        // Apply the theme passed down from ContentView
        .colorScheme(currentTheme.primaryColor == .white ? .dark : .light)
    }
}
