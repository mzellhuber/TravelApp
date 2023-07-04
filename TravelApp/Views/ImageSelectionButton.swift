//
//  ImageSelectionButton.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 21/06/23.
//

import SwiftUI

enum ImageShape {
    case circle, square
}

struct ImageSelectionButton: View {
    let image: UIImage?
    let onImageSelected: (UIImage) -> Void
    let shape: ImageShape
    let width: CGFloat?
    let height: CGFloat?

    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var imageSourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var inputImage: UIImage?

    var body: some View {
        ZStack {
            if let image = image {
                if shape == .circle {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: width ?? UIScreen.main.bounds.width, height: height ?? UIScreen.main.bounds.height)
                        .padding()
                } else {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Rectangle())
                        .frame(width: width ?? UIScreen.main.bounds.width, height: height ?? UIScreen.main.bounds.height)
                        .padding()
                }
            } else {
                if shape == .circle {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width ?? UIScreen.main.bounds.width, height: height ?? UIScreen.main.bounds.height)
                        .padding()
                } else {
                    Image(systemName: "rectangle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width ?? UIScreen.main.bounds.width, height: height ?? UIScreen.main.bounds.height)
                        .padding()
                }
            }
            Button(action: {
                showingActionSheet = true
            }) {
                Image(systemName: "camera")
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .clipShape(Circle())
            }
            .offset(x: 30, y: 30)
        }
        .actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(title: Text("Select Image"), buttons: [
                .default(Text("Photo Library")) {
                    self.imageSourceType = .photoLibrary
                    self.showingImagePicker = true
                },
                .default(Text("Camera")) {
                    self.imageSourceType = .camera
                    self.showingImagePicker = true
                },
                .cancel()
            ])
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(selectedImage: self.$inputImage, sourceType: self.imageSourceType)
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        onImageSelected(inputImage)
    }
}
