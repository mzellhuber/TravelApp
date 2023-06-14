//
//  TabView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 13.06.23.
//

import SwiftUI

// TODO: tried to make animated sf symbols but could not do in in TabView
struct MainView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Image(systemName: "house")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            MyTripsView()
                .tabItem {
                    Image(systemName: "map")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
