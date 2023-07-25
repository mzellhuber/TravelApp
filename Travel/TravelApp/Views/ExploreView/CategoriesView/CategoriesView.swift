//
//  CategoriesView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 23.06.23.
//

import SwiftUI

struct CategoriesView: View {
    @State var selection: Bool = false
    private let categories: [Category] = [.mountains, .forest, .beach, .camp]
    
    var body: some View {
        VStack {
            HStack {
                Text("Categories")
                    .font(.title)
                    .bold()
                Spacer()
                NavigationStack {
                    Button {
                        selection = true
                    } label: {
                        HStack {
                            Text("See all")
                            Image(systemName: "arrowtriangle.right")
                        }
                    }
                    .tint(.gray)
                    .bold()
                    .navigationDestination(isPresented: $selection, destination: {
                        CategoryListView()
                    })
                }
            }
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(categories, id: \.self) { category in
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
