//
//  Country.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 21/06/23.
//

import Foundation

struct Country: Codable, Hashable {
    let name: CountryName
    let cca2: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(cca2)
    }

    static func ==(lhs: Country, rhs: Country) -> Bool {
        return lhs.cca2 == rhs.cca2
    }
}

struct CountryName: Codable {
    let common: String
}

extension Country {
    var emojiFlag: String {
        return self.cca2.unicodeScalars
            .map { 127397 + $0.value }
            .compactMap(UnicodeScalar.init)
            .map(String.init)
            .joined()
    }
}
