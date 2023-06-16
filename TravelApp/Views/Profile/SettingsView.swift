//
//  SettingsView.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 15/06/23.
//

import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var temperatureUnit = "Celsius"
    @State private var themePreference = "System"
    @State private var logOutConfirmation = false
    @State private var isLoggedIn = false  // Simulate user login status

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Preferences")) {
                    Toggle(isOn: $notificationsEnabled) {
                        Text("Enable Notifications")
                    }
                    
                    Picker("Temperature Units", selection: $temperatureUnit) {
                        Text("Celsius").tag("Celsius")
                        Text("Fahrenheit").tag("Fahrenheit")
                    }
                    
                    Picker("Theme", selection: $themePreference) {
                        Text("Light").tag("Light")
                        Text("Dark").tag("Dark")
                        Text("System").tag("System")
                    }
                }
                
                Section {
                    Button(action: {
                        isLoggedIn ? logOut() : logIn()
                    }) {
                        Text(isLoggedIn ? "Log Out" : "Log In")
                            .foregroundColor(isLoggedIn ? .red : .blue)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    private func logIn() {
        // TODO: Handle log in
        isLoggedIn = true
    }
    
    private func logOut() {
        // TODO: Handle log out
        isLoggedIn = false
    }
}

#Preview {
    SettingsView()
}
