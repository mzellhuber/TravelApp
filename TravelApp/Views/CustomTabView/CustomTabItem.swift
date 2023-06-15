//
//  CustomTabItem.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 14.06.23.
//

import SwiftUI

struct CustomTabItem: View {
    let imageName: String
    var isSelected: Bool = true
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .symbolEffect(.scale.up.byLayer, isActive: isSelected)
                .foregroundColor(.purple)
        }
    }
}

#Preview {
    CustomTabItem(imageName: "house", isSelected: true)
}
