//
//  SearchView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 13.06.23.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    var searching = false
    
    var body: some View {
        NavigationStack {
            VStack {
                CustomSearchBar(selectedIndex: .constant(TabType.search.rawValue), searchText: $searchText, isActive: true)
                Spacer()
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.large)
            .padding(.leading, 20)
            .padding(.trailing, 20)
        }
    }
}

#Preview {
    SearchView()
}
