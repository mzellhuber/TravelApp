//
//  TripImagesView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 30.06.23.
//

import SwiftUI

struct TripImagesView: View {
    @Binding var selectedImage: ImageResource
    let images: [ImageResource]
    
    var body: some View {
        HStack {
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(images, id: \.self) { image in
                        Button {
                            selectedImage = image
                        } label: {
                            Image(image)
                                .resizable()
                                .scaledToFill()
                        }
                        .frame(width: 60, height: 60)
                        .cornerRadius(10)
                    }
                }
            }
            .scrollClipDisabled()
            .scrollIndicators(.hidden)
            .padding(10)
        }
        .background(.white.opacity(0.4))
        .cornerRadius(10)
        .padding([.leading, .trailing], 10)
        .frame(maxWidth: UIScreen.main.bounds.width)
        .fixedSize()
        .shadow(color: .gray.opacity(0.9), radius: 10)
    }
}

#Preview {
    TripImagesView(selectedImage: .constant(ImageResource(name: "forest", bundle: Bundle.main)), images: [ImageResource(name: "forest", bundle: Bundle.main), ImageResource(name: "mountains", bundle: Bundle.main)])
}
