//
//  CountriesFetcher.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 25.07.23.
//

import Foundation
import Networking

protocol CountriesFetcher {
    func fetchCountries() async throws -> [Country]
}

actor FetchCountriesService: CountriesFetcher  {
    func fetchCountries() async throws -> [Country] {
        let requestData = CountriesRequest.countryList
        let countries: [Country] = try await NetworkingManager().load(requestData)
        return countries
    }
}
