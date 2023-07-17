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
        NavigationLink(destination: TripDetailView(trip: trip)) {
            VStack {
                ZStack {
                    if let imageUrl = trip.details.images.first {
                        RemoteImage(urlString: imageUrl)
                            .frame(width: dimension - 5, height: dimension - 5)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    } else {
                        Image("placeholder")
                            .resizable()
                            .scaledToFill()
                            .frame(width: dimension - 5, height: dimension - 5)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }

                    VStack {
                        Spacer()

                        VStack(alignment: .leading, spacing: 4) {
                            Text(trip.title)
                                .font(.caption)
                                .bold()
                                .foregroundColor(.white)
                                .lineLimit(1)

                            HStack {
                                Text(trip.location)
                                    .font(.caption2)
                                    .foregroundColor(.white)
                                Spacer()
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text(trip.rating)
                                    .font(.caption2)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.black.opacity(0.6))
                        .cornerRadius(10)
                        .padding(.trailing, 5)
                        .padding(.leading, 5)
                    }
                    .padding(.bottom, 5)
                }
                .cornerRadius(10)
                .padding(5)
            }
            .background(Color.white)
            .cornerRadius(10)
            .frame(width: dimension, height: dimension)
            .shadow(color: Color.gray.opacity(0.2), radius: 10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ContentView: View {
    var body: some View {
        TripView(trip: Trip(id: UUID(),
                            title: "Avanada Logo",
                            location: "Thailand",
                            rating: "4.9",
                            imageName: "https://example.com/mountains.jpg",
                            details: TripDetail(images: [], description: "")),
                 dimension: 200)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
