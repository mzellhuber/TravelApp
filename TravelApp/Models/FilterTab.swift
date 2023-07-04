//
//  FilterTabs.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 26.06.23.
//

import Foundation

enum FilterTab: String, CaseIterable {
    case all = "All"
    case popular = "Popular"
    case recommended = "Recommended"
    case mostViews = "Most Viewed"
    case recent = "Recent"
    
    var trips: [Trip] {
        switch self {
        case .all:
            return [Trips.trips[0], Trips.trips[1], Trips.trips[2]]
        case .popular:
            return [Trips.trips[4], Trips.trips[3], Trips.trips[0]]
        case .recommended:
            return [Trips.trips[3], Trips.trips[1], Trips.trips[2]]
        case .mostViews:
            return [Trips.trips[2], Trips.trips[4], Trips.trips[3]]
        case .recent:
            return [Trips.trips[2], Trips.trips[0], Trips.trips[3]]
        }
    }
}
