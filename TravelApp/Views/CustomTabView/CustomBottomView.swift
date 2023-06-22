//
//  CustomBottomView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 14.06.23.
//

import SwiftUI

struct CustomBottomView: View {
    let tabbarItems: [CustomTabItem]
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            ForEach(tabbarItems.indices, id: \.self) { index in
                let item = tabbarItems[index]
                Button {
                    self.selectedIndex = index
                } label: {
                    let isSelected = selectedIndex == index
                    CustomTabItem(imageName: item.imageName, isSelected: isSelected)
                        .padding(.top)
                }
            }
        }
        .frame(maxHeight: 50)
        .background(Color.clear)
    }
}

#Preview {
    CustomBottomView(tabbarItems: [.init(imageName: "house"), .init(imageName: "person.crop.circle")], selectedIndex: .constant(0))
}
