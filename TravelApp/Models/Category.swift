//
//  Category.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 26.06.23.
//

import DeveloperToolsSupport

enum Category: String, CaseIterable {
    case mountains = "Mountains"
    case camp = "Camp"
    case beach = "Beach"
    case forest = "Forest"
    
    var image: ImageResource {
        switch self {
        case .mountains:
            return .mountains
        case .beach:
            return .sea
        case .camp:
            return .camp
        case .forest:
            return .forest
        }
    }
}
