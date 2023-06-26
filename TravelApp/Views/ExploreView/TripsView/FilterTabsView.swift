//
//  FilterTabsView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 23.06.23.
//

import SwiftUI

struct FilterTabsView: View {
    @State var selectedTab: FilterTab = .all
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(FilterTab.allCases, id: \.self) { tab in
                    FilterTabView(tab: tab, selectedTab: $selectedTab)
                }
            }
        }
        .scrollIndicators(.hidden)
        .scrollClipDisabled()
    }
}

#Preview {
    FilterTabsView()
}
