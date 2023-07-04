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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.modelContext) private var modelContext
    
    @Binding var profile: Profile
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
    
    init(profile: Binding<Profile>) {
        self._profile = profile
        print("Profile in initializer: \(String(describing: profile.wrappedValue))")
    }
    
    var body: some View {
            VStack {
                ZStack(alignment: .bottomLeading) {
                    ImageSelectionButtonFactory.createSquareButton(image: bannerImage, onImageSelected: { selectedImage in
                        self.bannerImage = selectedImage
                    }, width: UIScreen.main.bounds.width, height: 200)
                    .aspectRatio(contentMode: .fill)
                    //.frame(height: 200)
                    .clipped()
                    .edgesIgnoringSafeArea(.top)
                    
                    ImageSelectionButtonFactory.createCircleButton(image: image, onImageSelected: { selectedImage in
                        self.image = selectedImage
                    }, width: 100, height: 100)
                    .scaledToFit()
                    .offset(y: -40)
                    .padding(.leading, 40)
                }
            Form {
                Section(header: Text("Name")) {
                    TextField("Name", text: $name)
                }
                Section(header: Text("Email")) {
                    TextField("Email", text: $email)
                        .textContentType(.emailAddress)
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
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(selectedImage: self.$inputImage, sourceType: self.imageSourceType)
        }
        .onAppear {
            name = profile.name ?? ""
            email = profile.email ?? ""
            city = profile.city ?? ""
            if let countryCode = profile.country {
                selectedCountry = countries.first { $0.cca2 == countryCode }
            }
            if let imageData = profile.image {
                image = UIImage(data: imageData)
            }
            if let bannerImageData = profile.bannerImage {
                bannerImage = UIImage(data: bannerImageData)
            }
            
            fetchCountries()
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarBackButtonHidden(true) // Hides the default back button
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.backward.circle.fill")
                .foregroundColor(.white)
        }, trailing: Button(action: {
            updateProfile()
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.white)
        })
    }
    
    func updateProfile() {
        print("Profile in updateProfile: \(String(describing: profile))")
        
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
    
    private func fetchCountries() {
        Task {
            do {
                countries = try await countryFetcher.fetchCountries().sorted{ $0.name.common < $1.name.common }
                if let countryCode = profile.country {
                    selectedCountry = countries.first { $0.cca2 == countryCode }
                }
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
