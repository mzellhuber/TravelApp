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
    @State private var rating: String = ""
    @State private var imageName: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "map.fill")
                .font(.largeTitle)
                .foregroundColor(.gray)
            
            TextField("Title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Location", text: $location)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Rating", text: $rating)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            
            TextField("Image Name/URL", text: $imageName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Add Trip") {
                // Create a new Trip instance using the user input
                let newTrip = Trip(id: UUID(), title: title, location: location, rating: rating, imageName: imageName, details: TripDetail(images: [], description: "test"))
                
                // Perform any additional actions with the new trip (e.g., store in a data source)
                
                // Reset the input fields
                title = ""
                location = ""
                rating = ""
                imageName = ""
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
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
