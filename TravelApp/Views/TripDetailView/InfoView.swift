//
//  InfoView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 29.06.23.
//

import SwiftUI

struct InfoView: View {
    let trip: Trip
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                HStack {
                    Text(trip.title)
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding(.top, 20)
                HStack {
                    Image(systemName: "mappin.circle.fill")
                    Text(trip.location)
                    Spacer()
                    Image(systemName: "star")
                    Text(trip.rating)
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
                Text("Thailand (/ˈtaɪlænd, -lənd/ TY-land, -⁠lənd),[b][9] officially the Kingdom of Thailand and historically known as Siam (/saɪˈæm, ˈsaɪæm/),[c][10][11] is a country in Southeast Asia on the Indochinese Peninsula. With a population of almost 70 million,[12] it spans 513,120 square kilometres (198,120 sq mi). Thailand is bordered to the north by Myanmar and Laos, to the east by Laos and Cambodia, to the south by the Gulf of Thailand and Malaysia, and to the west by the Andaman Sea; it also shares maritime borders with Vietnam to the southeast, and Indonesia and India to the southwest. Bangkok is the nation's capital and largest city. Thailand (/ˈtaɪlænd, -lənd/ TY-land, -⁠lənd),[b][9] officially the Kingdom of Thailand and historically known as Siam (/saɪˈæm, ˈsaɪæm/),[c][10][11] is a country in Southeast Asia on the Indochinese Peninsula. With a population of almost 70 million,[12] it spans 513,120 square kilometres (198,120 sq mi). Thailand is bordered to the north by Myanmar and Laos, to the east by Laos and Cambodia, to the south by the Gulf of Thailand and Malaysia, and to the west by the Andaman Sea; it also shares maritime borders with Vietnam to the southeast, and Indonesia and India to the southwest. Bangkok is the nation's capital and largest city. Thailand (/ˈtaɪlænd, -lənd/ TY-land, -⁠lənd),[b][9] officially the Kingdom of Thailand and historically known as Siam (/saɪˈæm, ˈsaɪæm/),[c][10][11] is a country in Southeast Asia on the Indochinese Peninsula. With a population of almost 70 million,[12] it spans 513,120 square kilometres (198,120 sq mi). Thailand is bordered to the north by Myanmar and Laos, to the east by Laos and Cambodia, to the south by the Gulf of Thailand and Malaysia, and to the west by the Andaman Sea; it also shares maritime borders with Vietnam to the southeast, and Indonesia and India to the southwest. Bangkok is the nation's capital and largest city.")
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
    InfoView(trip: .init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: ImageResource(name: "mountains", bundle: Bundle.main)))
}
