//
//  StarRating.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 10/07/23.
//

import SwiftUI

struct StarRating: View {
    @Binding var rating: Double

    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var halfImage = Image(systemName: "star.leadinghalf.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow

    func image(for number: Int) -> Image {
        if number > Int(rating) {
            return offImage ?? onImage
        } else if number == Int(rating) && (rating.rounded(.down) != rating) {
            return halfImage
        } else {
            return onImage
        }
    }

    var body: some View {
        HStack {
            if !label.isEmpty {
                Text(label)
            }
            ForEach(1..<maximumRating + 1) { number in
                self.image(for: number)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                    .foregroundColor(number > Int(rating) ? offColor : onColor)
                    .onTapGesture {
                        rating = Double(number)
                    }
                .accessibility(label: Text("\(number) of \(maximumRating)"))
            }
        }
    }
}
