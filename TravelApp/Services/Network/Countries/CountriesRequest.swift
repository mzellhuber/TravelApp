//
//  CountriesRequest.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 21/06/23.
//

import Foundation

struct CountriesRequest: NetworkRequest {
    let baseURL: String = "https://restcountries.com"
    let path: String = "/v3.1/all"
    let method: HTTPMethod = .GET
    let queryItems: [URLQueryItem]? = [
        URLQueryItem(name: "fields", value: "name,cca3")
    ]
    let headers: [String: String]? = nil
    let body: Data? = nil
}
