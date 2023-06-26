//
//  FilterTabView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 23.06.23.
//

import SwiftUI

struct FilterTabView: View {
    let tab: FilterTab
    @Binding var selectedTab: FilterTab
    
    var body: some View {
        Button {
            selectedTab = tab
        } label: {
            Text(tab.rawValue)
        }
        .tint(selectedTab == tab ? .black : .gray)
    }
}

#Preview {
    FilterTabView(tab: .all, selectedTab: .constant(.all))
}
