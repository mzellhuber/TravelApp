//
//  SearchView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 13.06.23.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var filteredTrips: [Trip] = Trips.trips
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ScrollView(.vertical) {
                    VStack(spacing: 20){
                        CustomSearchBar(searchText: $searchText, isActive: true)
                            .onChange(of: searchText) {
                                filterTrips()
                            }
                        ForEach(filteredTrips, id: \.self) { trip in
                            TripView(trip: trip, dimension: geo.size.width)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .scrollClipDisabled()
            }
            .navigationTitle("Search your next trip")
            .navigationBarTitleDisplayMode(.large)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .background(.lightGrey)
        }
    }
    
    private func filterTrips() {
        if searchText.isEmpty {
            filteredTrips = Trips.trips
        } else {
            filteredTrips = Trips.trips.filter { $0.title.contains(searchText) || $0.location.contains(searchText)
            }
        }
    }
}

#Preview {
    SearchView()
}
