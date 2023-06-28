//
//  Trip.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 26.06.23.
//

import DeveloperToolsSupport

struct Trip: Hashable {
    let title: String
    let location: String
    let rating: String
    let imageName: ImageResource
}

enum Trips {
    static let trips: [Trip] = [.init(title: "Avanada Logo", location: "Thailand", rating: "5", imageName: .mountains),
                                .init(title: "Batumi", location: "Georgia", rating: "4.9", imageName: .sea),
                                .init(title: "Berlin", location: "Germany", rating: "5", imageName: .camp),
                                .init(title: "Racha", location: "Georgia", rating: "4.5", imageName: .camp),
                                .init(title: "Tiveden", location: "Sweden", rating: "4.2", imageName: .forest)]
}
