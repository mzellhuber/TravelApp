//
//  TripDetail.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 30.06.23.
//

import Foundation
import DeveloperToolsSupport

struct TripDetail {
    let id: UUID
    let title: String
    let location: String
    let rating: String
    let images: [ImageResource]
    let description: String
}

enum TripDetails {
    static let tripDetails: [TripDetail] = [.init(id: UUID(),
                                                  title: "Avanada Logo",
                                                  location: "Thailand",
                                                  rating: "5",
                                                  images: [.mountains, .forest, .camp, .sea, .camp, .forest, .mountains],
                                                  description: "Thailand (/ˈtaɪlænd, -lənd/ TY-land, -⁠lənd),[b][9] officially the Kingdom of Thailand and historically known as Siam (/saɪˈæm, ˈsaɪæm/),[c][10][11] is a country in Southeast Asia on the Indochinese Peninsula. With a population of almost 70 million,[12] it spans 513,120 square kilometres (198,120 sq mi). Thailand is bordered to the north by Myanmar and Laos, to the east by Laos and Cambodia, to the south by the Gulf of Thailand and Malaysia, and to the west by the Andaman Sea; it also shares maritime borders with Vietnam to the southeast, and Indonesia and India to the southwest. Bangkok is the nation's capital and largest city. Thailand (/ˈtaɪlænd, -lənd/ TY-land, -⁠lənd),[b][9] officially the Kingdom of Thailand and historically known as Siam (/saɪˈæm, ˈsaɪæm/),[c][10][11] is a country in Southeast Asia on the Indochinese Peninsula. With a population of almost 70 million,[12] it spans 513,120 square kilometres (198,120 sq mi). Thailand is bordered to the north by Myanmar and Laos, to the east by Laos and Cambodia, to the south by the Gulf of Thailand and Malaysia, and to the west by the Andaman Sea; it also shares maritime borders with Vietnam to the southeast, and Indonesia and India to the southwest. Bangkok is the nation's capital and largest city. Thailand (/ˈtaɪlænd, -lənd/ TY-land, -⁠lənd),[b][9] officially the Kingdom of Thailand and historically known as Siam (/saɪˈæm, ˈsaɪæm/),[c][10][11] is a country in Southeast Asia on the Indochinese Peninsula. With a population of almost 70 million,[12] it spans 513,120 square kilometres (198,120 sq mi). Thailand is bordered to the north by Myanmar and Laos, to the east by Laos and Cambodia, to the south by the Gulf of Thailand and Malaysia, and to the west by the Andaman Sea; it also shares maritime borders with Vietnam to the southeast, and Indonesia and India to the southwest. Bangkok is the nation's capital and largest city."),
                                            .init(id: UUID(),
                                                  title: "Batumi",
                                                  location: "Georgia",
                                                  rating: "4.9",
                                                  images: [.sea, .camp], description: "Thailand (/ˈtaɪlænd, -lənd/ TY-land, -⁠lənd),[b][9] officially the Kingdom of Thailand and historically known as Siam (/saɪˈæm, ˈsaɪæm/),[c][10][11] is a country in Southeast Asia on the Indochinese Peninsula. With a population of almost 70 million,[12] it spans 513,120 square kilometres (198,120 sq mi)."),
                                            .init(id: UUID(),
                                                  title: "Berlin",
                                                  location: "Germany",
                                                  rating: "5",
                                                  images: [.camp, .forest, .mountains],
                                                  description: "New trip"),
                                            .init(id: UUID(),
                                                  title: "Racha",
                                                  location: "Georgia",
                                                  rating: "4.5",
                                                  images: [.camp, .sea, .forest],
                                                  description: "Camping in the nature"),
                                            .init(id: UUID(),
                                                  title: "Tiveden",
                                                  location: "Sweden",
                                                  rating: "4.2",
                                                  images: [.forest],
                                                  description: "New")]
}
