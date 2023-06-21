//
//  EditProfileView.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 21/06/23.
//

import SwiftUI
import SwiftData
import os

struct EditProfileView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var profile: Profile?
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var city: String = ""
    @State private var selectedCountry: Country?
    @State private var image: String = ""
    @State private var bannerImage: String = ""
    
    @State private var countries: [Country] = []
    private let countryFetcher = CountryFetcher()
    
    private let logger = Logger(subsystem: "EditProfile", category: String(describing: EditProfileView.self))
    
    init(profile: Profile? = nil) {
        self._profile = State(initialValue: profile)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Name", text: $name)
                }
                Section(header: Text("Email")) {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                }
                Section(header: Text("City")) {
                    TextField("City", text: $city)
                }
                Section(header: Text("Country")) {
                    Picker(selection: $selectedCountry, label: Text("Country")) {
                        ForEach(countries, id: \.self) { country in
                            Text("\(country.emojiFlag) \(country.name.common)").tag(country as Country?)
                        }
                    }
                }
                Section(header: Text("Profile Image")) {
                    TextField("Profile Image", text: $image)
                }
                Section(header: Text("Banner Image")) {
                    TextField("Banner Image", text: $bannerImage)
                }
            }
            .onAppear {
                if let profile = profile {
                    name = profile.name ?? ""
                    email = profile.email ?? ""
                    city = profile.city ?? ""
                    if let countryCode = profile.country {
                        selectedCountry = countries.first { $0.cca3 == countryCode }
                    }
                    image = profile.image ?? ""
                    bannerImage = profile.bannerImage ?? ""
                }
                fetchCountries()
            }
            .navigationBarTitle(Text("Edit Profile"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                updateProfile()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save")
            })
        }
    }
    
    func updateProfile() {
        if let profile = profile {
            profile.name = name
            profile.email = email
            profile.city = city
            profile.country = selectedCountry?.cca3
            profile.image = image
            profile.bannerImage = bannerImage
            
            // Save the updated profile to the persistent store
            try? viewContext.save()
            
        }
    }
    
    private func fetchCountries() {
        Task {
            do {
                countries = try await countryFetcher.fetchCountries()
            } catch {
                switch error {
                case NetworkError.invalidURL:
                    // Handle invalid URL error
                    logger.error("Invalid URL")
                case NetworkError.decodingFailed:
                    // Handle decoding failure error
                    logger.error("Decoding failed")
                default:
                    // Handle other errors
                    logger.error("An error occurred: \(error)")
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
