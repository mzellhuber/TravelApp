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
        GeometryReader { geometry in
            HStack {
                ForEach(tabbarItems.indices, id: \.self) { index in
                    let item = tabbarItems[index]
                    VStack {
                        Button {
                            self.selectedIndex = index
                        } label: {
                            let isSelected = selectedIndex == index
                            CustomTabItem(imageName: item.imageName, isSelected: isSelected)
                                .frame(width: geometry.size.width/CGFloat(tabbarItems.count),
                                       height: geometry.size.height,
                                       alignment: .bottom)
                        }
                        Spacer()
                    }
                }
            }
            .frame(width: geometry.size.width,
                   height: geometry.size.height,
                   alignment: .bottom)
            .background(Color.clear)
        }
    }
}

#Preview {
    CustomBottomView(tabbarItems: [.init(imageName: "house"), .init(imageName: "person.crop.circle")], selectedIndex: .constant(0))
}
