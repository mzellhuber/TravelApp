//
//  Trip.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 26.06.23.
//

import Foundation
import SwiftData
import Combine

@Model
class Trip: Hashable, Equatable {
    static func ==(lhs: Trip, rhs: Trip) -> Bool {
        return lhs.id.uuidString == rhs.id.uuidString
    }
    
    @Attribute(.unique) var id: UUID
    let title: String
    let location: String
    let rating: String
    let imageName: String
    
    @Relationship(.cascade)
    var details: TripDetail
    //var cancellables = Set<AnyCancellable>()
    
    init(id: UUID, title: String, location: String, rating: String, imageName: String, details: TripDetail) {
        self.id = id
        self.title = title
        self.location = location
        self.rating = rating
        self.imageName = imageName
        self.details = details
    }
    
//    func fetchImages(from urls: [URL]) {
//        Publishers.MergeMany(urls.map { URLSession.shared.dataTaskPublisher(for: $0) })
//            .sink(
//                receiveCompletion: { _ in },
//                receiveValue: { data, _ in
//                    self.details.images.append(data)
//                }
//            )
//            .store(in: &cancellables)
//    }
}

@Model
class TripDetail {
    @Attribute(.unique) var id: UUID
    var images: [Data] = []
    let description: String
    
    init(images: [Data], description: String) {
        self.images = images
        self.description = description
    }
}
