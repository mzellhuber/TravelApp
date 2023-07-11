//
//  AddTripView.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 08/07/23.
//

import SwiftUI

struct AddTripView: View {
    @State private var title: String = ""
    @State private var location: String = ""
    @State private var rating: Double = 0.0
    @State private var description: String = ""
    @State private var imageFileURLs: [URL] = []
    @State private var isFormSubmitted: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Add a New Trip")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            Form {
                Section(header: Text("Trip Information")) {
                    RequiredTextField(text: $title, placeholder: "Title", fieldName: "Title", isRequired: true)
                        .accentColor(.blue)

                    RequiredTextField(text: $location, placeholder: "Location", fieldName: "Location", isRequired: true)
                        .accentColor(.blue)

                    StarRating(rating: $rating, maximumRating: 5)
                        .padding(.vertical, 20)
                }
                
                Section(header: Text("Trip Description")) {
                    TextEditor(text: $description)
                        .frame(height: 100)
                        .accentColor(.blue)
                }
                
                Section(header: Text("Trip Images")) {
                    ForEach(imageFileURLs.indices, id: \.self) { index in
                        ImageSelectionButtonFactory.createSquareButton(image: loadImageFromURL(imageFileURLs[index]), onImageSelected: { selectedImage in
                            // Update the selected image at the corresponding index
                            let fileURL = saveImageToFile(selectedImage)
                            if let fileURL = fileURL {
                                imageFileURLs[index] = fileURL
                            }
                        }, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3)
                        .cornerRadius(10)
                        .padding(.vertical, 8)
                    }
                    
                    if imageFileURLs.count < 5 {
                        Button(action: {
                            // Add a placeholder image file URL to the array
                            let placeholderURL = Bundle.main.url(forResource: "placeholder", withExtension: "png")!
                            imageFileURLs.append(placeholderURL)
                        }) {
                            HStack {
                                Image(systemName: "plus")
                                    .font(.title)
                                    .foregroundColor(.blue)
                                Text("Add Image")
                                    .font(.headline)
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }

                Section {
                    Button(action: {
                        isFormSubmitted = true
                        if !isRequiredFieldsEmpty() {
                            // Create a new Trip instance using the user input
                            let imageUrls = imageFileURLs.map { $0.absoluteString }
                            let newTrip = Trip(id: UUID(), title: title, location: location, rating: String(format: "%.1f", rating), imageName: "", details: TripDetail(images: imageUrls, description: description))

                            // Perform any additional actions with the new trip (e.g., store in a data source)
                            
                            // Reset the input fields
                            title = ""
                            location = ""
                            rating = 0.0
                            description = ""
                            imageFileURLs = []
                            isFormSubmitted = false
                        }
                    }) {
                        Text("Add Trip")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10)
                    }
                    .disabled(isRequiredFieldsEmpty())
                }
            }
        }
        .padding(.horizontal, 20)
    }
    
    private func isRequiredFieldsEmpty() -> Bool {
        return title.isEmpty || location.isEmpty || rating == 0.0
    }
    
    private func saveImageToFile(_ image: UIImage) -> URL? {
        // Implement the logic to save the image to a file and return the file URL
        // You can use FileManager or other techniques to save the image
        
        return nil // Replace with the actual file URL
    }
    
    private func loadImageFromURL(_ url: URL) -> UIImage {
        // Implement the logic to load the image from the provided URL
        // You can use methods like UIImage(contentsOfFile:) or URLSession to load the image
        
        return UIImage(named: "placeholder") ?? UIImage()
    }
}

#Preview {
    AddTripView()
}
