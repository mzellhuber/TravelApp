//
//  CategoriesRequest.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 04.08.23.
//

import Foundation
import Networking

enum CategoriesRequest: RequestProtocol {
    case allCategories
    
    var host: String {
        "localhost"
    }
    
    var port: Int? {
        8080
    }

    var scheme: Scheme {
        .http
    }
    
    var headers: [String : String] {
        [:]
    }
    
    var path: String {
        "/api/categories"
    }
    
    var query: [String : String?] {
        [:]
    }

    var requestType: RequestType {
        .GET
    }
}
