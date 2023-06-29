//
//  ExploreView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 13.06.23.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText: String = ""
    @State private var searchIsActive = false
    @Binding var selectedIndex: Int
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("Where do you want \nto go?")
                            .font(.title)
                            .bold()
                            .lineLimit(2, reservesSpace: true)
                        Spacer()
                    }
                    CustomSearchBar(searchText: .constant(""))
                        .onTapGesture {
                            selectedIndex = TabType.search.rawValue
                        }
                        .padding(.bottom)
                    TripsView()
                    CategoriesView()
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .toolbar {
                    ToolbarItem {
                        Button(action: {}, label: {
                            Image(systemName: "person.circle")
                        })
                        .tint(.black)
                    }
                    ToolbarItem (placement: .navigation) {
                        HStack {
                            Text("Hi, Mariam,")
                                .font(.subheadline)
                                .bold()
                            Spacer()
                        }
                    }
                }
            }
            .background(.lightGrey)
            .scrollClipDisabled()
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ExploreView(selectedIndex: .constant(0))
}
