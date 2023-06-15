//
//  TabView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 13.06.23.
//

import SwiftUI

struct MainView: View {
    @State var selectedIndex: Int = 0
    
    var body: some View {
        CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
            let type = TabType(rawValue: index) ?? .home
            getTabView(type: type)
        }
    }
    
    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .home:
            ExploreView()
        case .search:
            SearchView()
        case .myTrips:
            MyTripsView()
        case .profile:
            ProfileView()
        }
    }
}

#Preview {
    MainView()
}
