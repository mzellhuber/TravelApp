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
    @State private var rating: Double = 0
    @State private var imageName: String = ""
    @State private var tripImage: Data?
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Trip Details")) {
                    TextField("Title", text: $title)
                    TextField("Location", text: $location)
                    StarRating(rating: $rating)
                        .font(.title3)
                }
                
                Section(header: Text("Image")) {
                    HStack {
                        Spacer()
                        ImageSelectionButtonFactory.createCircleButton(image: UIImage(data: tripImage ?? Data()), onImageSelected: { selectedImage in
                            tripImage = selectedImage.jpegData(compressionQuality: 1.0)
                        })
                        .frame(width: 100, height: 100)
                        Spacer()
                    }
                }
                
                Section {
                    Button("Add Trip") {
                        // Create a new Trip instance using the user input
                        let newTrip = Trip(id: UUID(), title: title, location: location, rating: String(rating), imageName: imageName, details: TripDetail(images: [tripImage ?? Data()], description: "test"))
                        
                        // Perform any additional actions with the new trip (e.g., store in a data source)
                        
                        // Reset the input fields
                        title = ""
                        location = ""
                        rating = 0
                        imageName = ""
                        tripImage = nil
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
            }
            .navigationTitle("Add a New Trip")
        }
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
