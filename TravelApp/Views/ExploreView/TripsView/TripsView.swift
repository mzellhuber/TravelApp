//
//  TripsView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 23.06.23.
//

import SwiftUI

import SwiftUI

struct TripsView: View {
    @State var selectedTab: FilterTab = .all
    @State var trips: [Trip] = []

    var filteredTrips: [Trip] {
        switch selectedTab {
        case .all:
            return trips
        case .popular:
            return trips
        case .recommended:
            return trips
        case .mostViews:
            return trips
        case .recent:
            return trips
        }
    }

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
                    ForEach(filteredTrips, id: \.self) { trip in
                        TripView(trip: trip, dimension: 200)
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
