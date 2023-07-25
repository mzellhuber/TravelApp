//
//  TravelAppApp.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 13/06/23.
//

import SwiftUI
import SwiftData

@main
struct TravelAppApp: App {
    
    @AppStorage("themePreference") var themePreference: String = "System"
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
                    .environment(\.colorScheme, colorScheme)
            }
        }
        .modelContainer(for: [Profile.self])
    }
    
    private var colorScheme: ColorScheme {
        switch themePreference {
        case "Light":
            return .light
        case "Dark":
            return .dark
        default:
            return .light
        }
    }
}
