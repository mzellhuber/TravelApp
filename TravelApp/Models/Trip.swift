//
//  Trip.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 26.06.23.
//

import Foundation

struct Trip: Hashable, Equatable {
    static func ==(lhs: Trip, rhs: Trip) -> Bool {
        return lhs.id.uuidString == rhs.id.uuidString
    }
    
    let id: UUID
    let title: String
    let location: String
    let rating: String
    let imageName: String
}

enum Trips {
    static let trips: [Trip] = [.init(id: UUID(),
                                      title: "Avanada Logo",
                                      location: "Thailand",
                                      rating: "5",
                                      imageName: "https://placehold.co/600x400"),
                                .init(id: UUID(),
                                      title: "Batumi",
                                      location: "Georgia",
                                      rating: "4.9",
                                      imageName: "https://placehold.co/600x400"),
                                .init(id: UUID(),
                                      title: "Berlin",
                                      location: "Germany",
                                      rating: "5",
                                      imageName: "https://placehold.co/600x400"),
                                .init(id: UUID(),
                                      title: "Racha",
                                      location: "Georgia",
                                      rating: "4.5",
                                      imageName: "https://placehold.co/600x400"),
                                .init(id: UUID(),
                                      title: "Tiveden",
                                      location: "Sweden",
                                      rating: "4.2",
                                      imageName: "https://placehold.co/600x400")]
}
