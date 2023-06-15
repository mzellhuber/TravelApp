//
//  CustomTabView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 14.06.23.
//

import SwiftUI

struct CustomTabView<Content: View>: View {
    let tabs: [CustomTabItem]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                TabView(selection: $selectedIndex) {
                    ForEach(tabs.indices, id: \.self) { index in
                        content(index)
                            .tag(index)
                    }
                }
                VStack {
                    CustomBottomView(tabbarItems: tabs, selectedIndex: $selectedIndex)
                }
            }
        }
    }
}

#Preview {
    CustomTabView<ExploreView>(tabs: [TabType.home.tabItem],                      selectedIndex: .constant(0), content: { _ in
        ExploreView()
    })
}

enum TabType: Int, CaseIterable {
    case home = 0
    case search
    case myTrips
    case profile
    
    var tabItem: CustomTabItem {
        switch self {
        case .home:
            return .init(imageName: "house")
        case .search:
            return .init(imageName: "magnifyingglass")
        case .myTrips:
            return .init(imageName: "map")
        case .profile:
            return .init(imageName: "person.crop.circle")
        }
    }
}
