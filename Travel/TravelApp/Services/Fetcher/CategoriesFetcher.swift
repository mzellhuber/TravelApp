//
//  CategoriesFetcher.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 04.08.23.
//

import Foundation
import Networking

protocol CategoriesFetcher {
    func fetchCategories() async throws -> [Category]
}

actor FetchCategoriesService: CategoriesFetcher  {
    func fetchCategories() async throws -> [Category] {
        let requestData = CategoriesRequest.allCategories
        let categories: [Category] = try await NetworkingManager().load(requestData)
        return categories
    }
}
