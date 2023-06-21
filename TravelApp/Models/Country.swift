//
//  Country.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 21/06/23.
//

import Foundation

struct Country: Codable {
    let name: CountryName
    let cca3: String
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
