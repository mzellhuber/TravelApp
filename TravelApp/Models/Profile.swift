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
    var image: Data?
    var bannerImage: Data?
    
    init(id: UUID = UUID(), name: String? = nil, email: String? = nil, city: String? = nil, country: String? = nil, image: Data? = nil, bannerImage: Data? = nil) {
        self.id = id
        self.name = name
        self.email = email
        self.city = city
        self.country = country
        self.image = image
        self.bannerImage = bannerImage
    }
}
