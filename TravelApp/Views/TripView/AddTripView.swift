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
    @State private var image: UIImage? = nil

    var body: some View {
        VStack(spacing: 20) {
            Text("Add a New Trip")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            Form {
                Section(header: Text("Trip Information")) {
                    TextField("Title", text: $title)
                        .accentColor(.blue)

                    TextField("Location", text: $location)
                        .accentColor(.blue)

                    StarRating(rating: $rating, maximumRating: 5)
                        .padding(.vertical, 20)
                }
                
                Section(header: Text("Trip Image")) {
                    ImageSelectionButtonFactory.createSquareButton(image: image, onImageSelected: { selectedImage in
                        image = selectedImage
                    }, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3)
                    .cornerRadius(10)
                    .padding(.top, 20)
                }

                Section {
                    Button(action: {
                        // Create a new Trip instance using the user input
                        let newTrip = Trip(id: UUID(), title: title, location: location, rating: String(format: "%.1f", rating), imageName: "", details: TripDetail(images: [], description: "test"))
                        
                        // Perform any additional actions with the new trip (e.g., store in a data source)
                        
                        // Reset the input fields
                        title = ""
                        location = ""
                        rating = 0.0
                        image = nil
                    }) {
                        Text("Add Trip")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

struct RemoteImage: View {
    let url: String
    
    var body: some View {
        // You can use a library or implement your own logic here to load and display the remote image
        // For simplicity, I'm just using a placeholder image
        Image("placeholder")
            .resizable()
            .scaledToFill()
    }
}

#Preview {
    AddTripView()
}
