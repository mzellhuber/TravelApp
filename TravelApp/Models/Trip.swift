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
        return lhs.uuid.uuidString == rhs.uuid.uuidString
    }
    
    @Attribute(originalName: "uuid_")
    let uuid: UUID
    
    @Attribute(originalName: "creationDate_")
    let creationDate: Date
    
    let title: String
    let location: String
    let rating: String
    
    @Relationship(.cascade, inverse: \TripDetail.trip)
    var details: TripDetail
    
    var profile: Profile?     // to-one relationships is always optional

    init(id: UUID = UUID(),
         title: String = "",
         location: String = "",
         rating: String = "0.0",
         imageName: String = "",
         details: TripDetail = TripDetail(),
         creationDate: Date = Date()) {
        self.uuid = id
        self.title = title
        self.location = location
        self.rating = rating
        self.details = details
    }
    
    static func delete(_ trip: Trip) {
        if let context = trip.context {
            context.delete(trip)
            //try? context.save() // suggested fix
        }
    }
}

@Model final public class TripDetail {
    @Attribute(originalName: "uuid_")
    let uuid: UUID
    
    @Attribute(originalName: "creationDate_")
    let creationDate: Date
    
    var images: [String] = []
    let desc: String
    
    @Relationship(.cascade, inverse: \Trip.details) var details = TripDetail()
    
    var trip: Trip?
        
    init(id: UUID = UUID(), images: [String] = [],
         description: String = "", creationDate: Date = Date()) {
        self.uuid = id
        self.images = images
        self.desc = description
    }
    
    static func delete(_ tripDetail: TripDetail) {
        if let context = tripDetail.context {
            context.delete(tripDetail)
            //try? context.save() // suggested fix
        }
    }
}
