//
//  TripsView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 23.06.23.
//

import SwiftUI

struct TripsView: View {
    @State var selectedTab: FilterTab = .all
    
    var body: some View {
        VStack {
            HStack {
                Text("Explore Trips")
                    .font(.title)
                    .bold()
                Spacer()
            }
            FilterTabsView(selectedTab: $selectedTab)
                .padding(.bottom)
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(selectedTab.trips, id: \.self) { trip in
                        TripView(trip: trip)
                    }
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
