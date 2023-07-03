//
//  InfoView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 29.06.23.
//

import SwiftUI

struct InfoView: View {
    let tripDetail: TripDetail
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                HStack {
                    Text(tripDetail.title)
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding(.top, 20)
                HStack {
                    Image(systemName: "mappin.circle.fill")
                    Text(tripDetail.location)
                    Spacer()
                    Image(systemName: "star")
                    Text(tripDetail.rating)
                }
                .padding([.top, .bottom], 10)
                .foregroundColor(.gray)
                HStack {
                    Image(systemName: "map")
                    Text("Direction")
                    Spacer()
                }
                .foregroundColor(.green)
                .bold()
                Divider()
                    .padding([.top, .bottom], 15)
                HStack {
                    Text("Description")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                Text(tripDetail.description)
                    .foregroundColor(.gray)
                    .padding(.top, 2)
                Spacer()
            }
            .padding()
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    InfoView(tripDetail: .init(id: 4,
                               title: "Tiveden",
                               location: "Sweden",
                               rating: "4.2",
                               images: [ImageResource(name: "forest", bundle: Bundle.main)],
                               description: "New"))
}
