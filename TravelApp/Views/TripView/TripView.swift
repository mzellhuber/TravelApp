//
//  TripView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 23.06.23.
//

import SwiftUI

struct TripView: View {
    let trip: Trip
    let dimension: CGFloat
    
    var body: some View {
        NavigationLink(value: trip) {
            VStack {
                ZStack {
                    Image(trip.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: dimension - 5, height: dimension - 5)
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
                            .foregroundColor(.black)
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
            .frame(width: dimension, height: dimension)
            .shadow(color: .gray.opacity(0.2), radius: 10)
        }
        .navigationDestination(for: Trip.self, destination: { trip in
            TripDetailView()
        })
    }
}

//#Preview {
//    TripView(trip: .init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains))
//}