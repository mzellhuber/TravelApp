//
//  CustomSearchBar.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 23.06.23.
//

import SwiftUI

struct CustomSearchBar: View {
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Discover trip", text: .constant(""))
                .font(Font.system(size: 21))
                .onTapGesture {
                    selectedIndex = TabType.search.rawValue
                }
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(.gray)
        }
        .padding(10)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.2), radius: 10)
    }
}

#Preview {
    CustomSearchBar(selectedIndex: .constant(0))
}
