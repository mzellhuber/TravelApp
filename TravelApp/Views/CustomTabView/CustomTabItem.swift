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
        GeometryReader { geometry in
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .symbolEffect(.scale.up.byLayer, isActive: isSelected)
                    .foregroundColor(.purple)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

#Preview {
    CustomTabItem(imageName: "house", isSelected: true)
}
