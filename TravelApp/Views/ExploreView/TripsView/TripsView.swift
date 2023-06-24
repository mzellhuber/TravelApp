//
//  TripsView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 23.06.23.
//

import SwiftUI

struct TripsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Explore Trips")
                    .font(.title)
                    .bold()
                Spacer()
            }
            PickersView()
                .padding(.bottom)
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    TripView(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains)
                    TripView(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains)
                    TripView(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains)
                    TripView(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains)
                }
            }
            .scrollClipDisabled()
            .scrollIndicators(.hidden)
        }
        .padding(.bottom, 40)
    }
}

#Preview {
    TripsView()
}
