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
    
    @Binding var profile: Profile?
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var city: String = ""
    @State private var selectedCountry: Country?
    @State private var image: UIImage?
    @State private var bannerImage: UIImage?
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var imageSourceType = UIImagePickerController.SourceType.photoLibrary
    
    @State private var countries: [Country] = []
    private let countryFetcher = CountryFetcher()
    
    private let logger = Logger(subsystem: "EditProfile", category: String(describing: EditProfileView.self))
    
    init(profile: Binding<Profile?>) {
        self._profile = profile
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
                        Text("None").tag(nil as Country?)
                        ForEach(countries, id: \.self) { country in
                            Text("\(country.emojiFlag) \(country.name.common)").tag(country as Country?)
                        }
                    }
                }
                Section(header: Text("Profile Image")) {
                    ImageSelectionButton(image: image) { selectedImage in
                        self.image = selectedImage
                    }
                }
                Section(header: Text("Banner Image")) {
                    ImageSelectionButton(image: bannerImage) { selectedImage in
                        self.bannerImage = selectedImage
                    }
                }
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: self.$inputImage, sourceType: self.imageSourceType)
            }
            .onAppear {
                if let profile = profile {
                    name = profile.name ?? ""
                    email = profile.email ?? ""
                    city = profile.city ?? ""
                    if let countryCode = profile.country {
                        selectedCountry = countries.first { $0.cca2 == countryCode }
                    }
                    // assuming 'imageData' and 'bannerImageData' are properties in 'Profile' that store the image data
                    if let imageData = profile.image {
                        image = UIImage(data: imageData)
                    }
                    if let bannerImageData = profile.bannerImage {
                        bannerImage = UIImage(data: bannerImageData)
                    }
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
            profile.country = selectedCountry?.cca2
            if let image = image {
                profile.image = image.pngData()
            }
            if let bannerImage = bannerImage {
                profile.bannerImage = bannerImage.pngData()
            }
            
            // Save the updated profile to the persistent store
            do {
                try viewContext.save()
            } catch {
                logger.error("Error saving the profile")
            }
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    private func fetchCountries() {
        Task {
            do {
                countries = try await countryFetcher.fetchCountries().sorted{ $0.name.common < $1.name.common }
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
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = inputImage
    }
}