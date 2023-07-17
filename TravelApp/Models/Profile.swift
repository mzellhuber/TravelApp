//
//  Profile.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 15/06/23.
//

import Foundation
import SwiftData

@Model
class Profile {
    @Attribute(originalName: "creationDate_")
    var creationDate: Date?
    
    @Attribute(originalName: "name_")
    var name: String?
    
    @Attribute(originalName: "uuid_")
    var uuid: UUID
    
    var email: String?
    var city: String?
    var country: String?
    var image: Data?
    var bannerImage: Data?
    
    @Relationship(.cascade, inverse: \Trip.profile)
    var trips: [Trip] = []
    
    init(id: UUID = UUID(), name: String? = nil, email: String? = nil, city: String? = nil, country: String? = nil, image: Data? = nil, bannerImage: Data? = nil, creationDate: Date = Date()) {
        self.uuid = id
        self.name = name
        self.email = email
        self.city = city
        self.country = country
        self.image = image
        self.bannerImage = bannerImage
    }
    
    static func delete (_ profile: Profile) {
        if let context = profile.context {
            context.delete(profile)
        }
    }
    
    static var exampleContext: ModelContext = {
        let schema = Schema([Profile.self, Trip.self, TripDetail.self])
        let configuration = ModelConfiguration(inMemory: true)
        let container = try! ModelContainer(for: schema, configurations: [configuration])
        return ModelContext(container)
    }()
    
    static func example() -> Profile {
        let profile = Profile(name: "test profile")
       let context = Profile.exampleContext
        context.insert(profile)
        
        return profile
    }
    
}
