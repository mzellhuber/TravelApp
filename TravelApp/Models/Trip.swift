//
//  Trip.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 26.06.23.
//

import DeveloperToolsSupport

struct Trip: Hashable {
    let id: Int
    let title: String
    let location: String
    let rating: String
    let imageName: ImageResource
}

enum Trips {
    static let trips: [Trip] = [.init(id: 0,
                                      title: "Avanada Logo",
                                      location: "Thailand",
                                      rating: "5",
                                      imageName: .mountains),
                                .init(id: 1,
                                      title: "Batumi",
                                      location: "Georgia",
                                      rating: "4.9",
                                      imageName: .sea),
                                .init(id: 2,
                                      title: "Berlin",
                                      location: "Germany",
                                      rating: "5",
                                      imageName: .camp),
                                .init(id: 3,
                                      title: "Racha",
                                      location: "Georgia",
                                      rating: "4.5",
                                      imageName: .camp),
                                .init(id: 4,
                                      title: "Tiveden",
                                      location: "Sweden",
                                      rating: "4.2",
                                      imageName: .forest)]
}
