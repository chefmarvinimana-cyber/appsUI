//
//  Theme.swift
//  appsUI
//
//  Created by Mar Vin on 18/04/2026.
//

import SwiftUI

/// A struct to hold the color palette for the app, making it easy to manage and reuse colors.
struct Theme: Hashable {
    let primaryColor: Color
    let secondaryColor: Color
    let accentColor: Color
    let backgroundColor: Color
    let cardBackgroundColor: Color

    /// The default light theme for the application.
    static let defaultTheme = Theme(
        primaryColor: Color("PrimaryTextColor"),
        secondaryColor: Color.gray,
        accentColor: Color.blue,
        backgroundColor: Color(UIColor.systemGroupedBackground),
        cardBackgroundColor: Color.white
    )

    /// A new dark theme with a neon cyan accent.
    static let neonDark = Theme(
        primaryColor: Color.white,
        secondaryColor: Color(white: 0.8),
        accentColor: Color(red: 0, green: 1, blue: 1), // Bright Cyan
        backgroundColor: Color(white: 0.1),
        cardBackgroundColor: Color(white: 0.15)
    )
}

// In a real project, you would go to Assets.xcassets and add a new Color Set.
extension Color {
    static let PrimaryTextColor = Color(red: 0.1, green: 0.1, blue: 0.15)
}