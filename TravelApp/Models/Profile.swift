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
    @Attribute(.unique) var id: UUID
    var name: String?
    var email: String?
    var city: String?
    var country: String?
    var image: String? // This could be a URL or a name of a local image file
    var bannerImage: String? // This could be a URL or a name of a local image file
    
    init(id: UUID = UUID(), name: String? = nil, email: String? = nil, city: String? = nil, country: String? = nil, image: String? = nil, bannerImage: String? = nil) {
        self.id = id
        self.name = name
        self.email = email
        self.city = city
        self.country = country
        self.image = image
        self.bannerImage = bannerImage
    }
}
