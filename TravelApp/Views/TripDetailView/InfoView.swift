//
//  InfoView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 29.06.23.
//

import SwiftUI

struct InfoView: View {
    let trip: Trip
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                HStack {
                    Text(trip.title)
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding(.top, 20)
                HStack {
                    Image(systemName: "mappin.circle.fill")
                    Text(trip.location)
                    Spacer()
                    Image(systemName: "star")
                    Text(trip.rating)
                }
                .padding([.top, .bottom], 10)
                .foregroundColor(.gray)
                HStack {
                    Image(systemName: "map")
                    Text("Direction")
                    Spacer()
                }
                .foregroundColor(.green)
                .bold()
                Divider()
                    .padding([.top, .bottom], 15)
                HStack {
                    Text("Description")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                Text(trip.details.description)
                    .foregroundColor(.gray)
                    .padding(.top, 2)
                Spacer()
            }
            .padding()
        }
        .scrollIndicators(.hidden)
    }
}
