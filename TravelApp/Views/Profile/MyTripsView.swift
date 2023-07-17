//
//  MyTripsView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 13.06.23.
//

import SwiftUI
// just for testing
struct MyTripsView: View {
    //var trips: [Trip] = []
    let trips: [Trip] = [
        Trip(id: UUID(), title: "Trip 1", location: "Location 1", rating: "4.5", details: TripDetail(images: ["image1.jpg", "image2.jpg"], description: "Description 1")),
        Trip(id: UUID(), title: "Trip 2", location: "Location 2", rating: "3.8", details: TripDetail(images: ["image3.jpg", "image4.jpg"], description: "Description 2")),
        Trip(id: UUID(), title: "Trip 3", location: "Location 3", rating: "4.2", details: TripDetail(images: ["image5.jpg", "image6.jpg"], description: "Description 3")),
        // Add more dummy trips here...
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout, spacing: 16) {
                ForEach(trips) { trip in
                    TripView(trip: trip, dimension: gridDimension)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
    }
    
    private var gridLayout: [GridItem] {
        let gridItems = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ]
        return gridItems
    }
    
    private var gridDimension: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let spacing: CGFloat = 16
        let totalSpacing = spacing * CGFloat(gridLayout.count - 1)
        let availableWidth = screenWidth - totalSpacing
        let dimension = availableWidth / CGFloat(gridLayout.count)
        return dimension
    }
}


#Preview {
    MyTripsView()
}
