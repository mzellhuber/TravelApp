//
//  Trip.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 26.06.23.
//

import Foundation
import SwiftData

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
    
    init(id: UUID, title: String, location: String, rating: String, imageName: String) {
        self.id = id
        self.title = title
        self.location = location
        self.rating = rating
        self.imageName = imageName
    }
}
