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
    var name: String
    var email: String
    var location: String
    var image: String // This could be a URL or a name of a local image file
    var bannerImage: String // This could be a URL or a name of a local image file
}
