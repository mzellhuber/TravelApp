//
//  CustomSearchBar.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 23.06.23.
//

import SwiftUI

struct CustomSearchBar: View {
    @Binding var searchText: String
    @FocusState var isFocused
    var isActive = false
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Discover trip", text: $searchText)
                .font(Font.system(size: 21))
                .focused($isFocused)
                .onAppear {
                    UITextField.appearance().clearButtonMode = .whileEditing
                    isFocused = isActive
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
    CustomSearchBar(searchText: .constant(""))
}
