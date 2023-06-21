//
//  Country.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 21/06/23.
//

import Foundation

struct Country: Codable, Hashable {
    let name: CountryName
    let cca3: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(cca3)
    }

    static func ==(lhs: Country, rhs: Country) -> Bool {
        return lhs.cca3 == rhs.cca3
    }
}

struct CountryName: Codable {
    let common: String
}

extension Country {
    var emojiFlag: String {
        return self.cca3.unicodeScalars
            .map { 127397 + $0.value }
            .compactMap(UnicodeScalar.init)
            .map(String.init)
            .joined()
    }
}
