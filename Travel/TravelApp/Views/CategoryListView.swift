//
//  CategoryListView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 03.07.23.
//

import SwiftUI

struct CategoryListView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var categories: [Category] = []
    
    var body: some View {
        List {
            ForEach(categories, id: \.id) { category in
                Label(
                    title: {
                        Text(category.title)
                    },
                    icon: {
                        Image(systemName: category.icon)
                            .foregroundColor(.purple)
                    }
                )
            }
        }
        .navigationTitle("All Categories")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            Image(systemName: "arrow.backward.circle.fill")
                .foregroundColor(.black)
        })
    }
}

#Preview {
    CategoryListView()
}
