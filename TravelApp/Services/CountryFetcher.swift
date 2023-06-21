//
//  CountryFetcher.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 21/06/23.
//

import Foundation

class CountryFetcher {
    func fetchCountries() async throws -> [Country] {
        let request = CountriesRequest()
        
        guard let urlRequest = request.urlRequest else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        guard let response = try? JSONDecoder().decode([Country].self, from: data) else {
            throw NetworkError.decodingFailed
        }
        
        return response
    }
}
