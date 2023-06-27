//
//  CustomSearchBar.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 23.06.23.
//

import SwiftUI

struct CustomSearchBar: View {
    @Binding var selectedIndex: Int
    @FocusState var focused
    @Binding var searchText: String
    var isActive: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Discover trip", text: $searchText)
                .font(Font.system(size: 21))
                .focused($focused)
                .onTapGesture {
                    if selectedIndex == TabType.home.rawValue {
                        selectedIndex = TabType.search.rawValue
                    }
                }
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(.gray)
        }
        .padding(10)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.2), radius: 10)
        .onAppear {
            focused = isActive
        }
    }
}

#Preview {
    CustomSearchBar(selectedIndex: .constant(0), searchText: .constant(""))
}
