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
    case mostViews = "Most Viewd"
    case recent = "Recent"
    
    var trips: [Trip] {
        switch self {
        case .all:
            return [.init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains),
                    .init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains),
                    .init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains)]
        case .popular:
            return [.init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains),
                    .init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains),
                    .init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains)]
        case .recommended:
            return [.init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains),
                    .init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains),
                    .init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains)]
        case .mostViews:
            return [.init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains),
                    .init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains),
                    .init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains)]
        case .recent:
            return [.init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains),
                    .init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains),
                    .init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: .mountains)]
        }
    }
}
