//
//  Category.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 26.06.23.
//

import Foundation

@MainActor
class CategoryModel: ObservableObject {
    private var categoriesFetcher: CategoriesFetcher
    @Published var categories: [Category] = []
    
    init(categoriesFetcher: CategoriesFetcher) {
        self.categoriesFetcher = categoriesFetcher
    }
    
    func getCategories() async throws {
        categories = try await categoriesFetcher.fetchCategories()
    }
}


class Category: Decodable {
    let id: String?
    let title: String
    let icon: String
    let imageUrl: URL
    
    init(id: String? = nil, title: String, icon: String, imageUrl: URL) {
        self.id = id
        self.title = title
        self.icon = icon
        self.imageUrl = imageUrl
    }
    
    static let mock = Category(title: "Mountains", icon: "mountain.2", imageUrl: URL(string: "https://images.app.goo.gl/9UYYnSXetiuvtH9a8")!)
}
