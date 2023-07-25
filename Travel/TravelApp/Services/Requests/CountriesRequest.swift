//
//  CountriesRequest.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 21/06/23.
//

import Foundation
import Networking

enum CountriesRequest: RequestProtocol {
    case countryList
    
    var host: String {
        "restcountries.com"
    }
    
    var headers: [String : String] {
        [:]
    }
    
    var path: String {
        "/v3.1/all"
    }
    
    var query: [String : String?] {
        ["fields": "name,cca2"]
    }

    var requestType: RequestType {
        .GET
    }
}
