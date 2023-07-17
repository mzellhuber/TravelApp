//
//  ProfileViewModel.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 17/07/23.
//

import SwiftUI
import SwiftData
import os

class ProfileViewModel: ObservableObject {
    @Query var profiles: [Profile]  // Fetches all profiles
    @Published var profile: Profile?
    @Published var countries: [Country] = []
    @Published var isShowingSheet = false
    @Published var isAddingTrip = false

    private let logger = Logger(subsystem: "Profile", category: String(describing: ProfileViewModel.self))
    private let countryFetcher = CountryFetcher()
    private var modelContext: ModelContext
    
    init() {
        modelContext = Profile.exampleContext
        setProfile()
    }
    
    func setProfile() {
        if let firstProfile = profiles.first {
            profile = firstProfile
        } else {
            profile = Profile()
            modelContext.insert(profile!)
        }
    }
    
    func addTrip() {
        isAddingTrip = true
    }
    
    func toggleSheet() {
        isShowingSheet.toggle()
    }
}
