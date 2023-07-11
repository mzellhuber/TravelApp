//
//  RemoteImage.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 10/07/23.
//

import SwiftUI

struct RemoteImage: View {
    let urlString: String

    @State private var image: UIImage? = nil

    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .onAppear {
                    loadImage()
                }
        } else {
            Image("placeholder")
                .resizable()
                .scaledToFill()
        }
    }

    private func loadImage() {
        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
