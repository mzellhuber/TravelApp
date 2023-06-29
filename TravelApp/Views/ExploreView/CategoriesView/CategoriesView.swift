//
//  CategoriesView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 23.06.23.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Categories")
                    .font(.title)
                    .bold()
                Spacer()
                Button {
                    
                } label: {
                    HStack {
                        Text("See all")
                        Image(systemName: "arrowtriangle.right")
                    }
                }
                .tint(.gray)
                .bold()
            }
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(Category.allCases, id: \.self) { category in
                        CategoryView(category: category)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .scrollClipDisabled()
            .padding(.bottom, 20)
        }
        .background(.lightGrey)
    }
}

#Preview {
    CategoriesView()
}
