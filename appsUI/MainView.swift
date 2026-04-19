//
//  MainView.swift
//  appsUI
//
//  Created by Mar Vin on 18/04/2026.
//

import SwiftUI

struct MainView: View {
    @Binding var currentTheme: Theme
    @Binding var isLoggedIn: Bool

    init(currentTheme: Binding<Theme>, isLoggedIn: Binding<Bool>) {
        self._currentTheme = currentTheme
        self._isLoggedIn = isLoggedIn
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(currentTheme.wrappedValue.cardBackgroundColor)
        
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(currentTheme.wrappedValue.secondaryColor)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(currentTheme.wrappedValue.secondaryColor)]
        
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(currentTheme.wrappedValue.accentColor)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(currentTheme.wrappedValue.accentColor)]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        TabView {
            AssistantView(theme: currentTheme)
                .tabItem {
                    Label("Assistant", systemImage: "message.fill")
                }

            SettingsView(currentTheme: $currentTheme, isLoggedIn: $isLoggedIn)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        // This makes sure the tab bar colors update when the theme changes
        .accentColor(currentTheme.accentColor)
    }
}
