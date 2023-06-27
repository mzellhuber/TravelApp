//
//  TripView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 23.06.23.
//

import SwiftUI

struct TripView: View {
    let trip: Trip
    
    var body: some View {
        VStack {
            ZStack {
                Image(trip.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 195, height: 195)
                VStack {
                    Spacer()
                    VStack {
                        VStack {
                            HStack {
                                Text(trip.title)
                                    .font(.caption)
                                    .bold()
                                Spacer()
                            }
                            .padding(.bottom, 2)
                            HStack {
                                Text(trip.location)
                                Text(trip.rating)
                                Spacer()
                            }
                            .font(.caption2)
                        }
                        .padding(10)
                    }
                    .background(.white.opacity(0.6))
                    .cornerRadius(10)
                    .padding(.trailing, 5)
                    .padding(.leading, 5)
                }
                .padding(.bottom, 5)
            }
            .cornerRadius(10)
            .padding(5)
        }
        .background(.white)
        .cornerRadius(10)
        .frame(width: 200, height: 200)
        .shadow(color: .gray.opacity(0.2), radius: 10)
    }
}

#Preview {
    TripView(trip: .init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains))
}
