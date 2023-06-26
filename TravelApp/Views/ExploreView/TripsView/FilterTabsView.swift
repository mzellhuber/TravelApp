//
//  FilterTabsView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 23.06.23.
//

import SwiftUI

struct FilterTabsView: View {
    var selectedTab: Binding<FilterTab>
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(FilterTab.allCases, id: \.self) { tab in
                    FilterTabView(tab: tab, selectedTab: selectedTab)
                }
            }
        }
        .scrollIndicators(.hidden)
        .scrollClipDisabled()
    }
}

#Preview {
    FilterTabsView(selectedTab: .constant(.all))
}
