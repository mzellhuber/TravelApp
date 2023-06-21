//
//  CountriesRequest.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 21/06/23.
//

import Foundation

struct CountriesRequest: NetworkRequest {
    var baseURL: String {
        return "https://restcountries.com/v3.1/all"
    }
    
    var path: String {
        return ""
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var queryItems: [URLQueryItem]? {
        return [
            URLQueryItem(name: "fields", value: "name,cca3")
        ]
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var body: Data? {
        return nil
    }
}
