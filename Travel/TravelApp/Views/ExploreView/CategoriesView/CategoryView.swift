//
//  CategoryView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 23.06.23.
//

import SwiftUI

struct CategoryView: View {
    let category: Category
    
    var body: some View {
        VStack {
            VStack {
                Image(category.image ?? .mountains)
                    .resizable()
                    .cornerRadius(10)
                    .frame(width: 120, height: 80)
                    .scaledToFill()
                Text(category.rawValue)
                    .bold()
            }
            .padding(.top, 5)
            .padding(.leading, 5)
            .padding(.trailing, 5)
            .padding(.bottom, 10)
            .background(.white)
            .cornerRadius(10)
        }
        .shadow(color: .gray.opacity(0.2), radius: 10)
    }
}

#Preview {
    CategoryView(category: .mountains)
}