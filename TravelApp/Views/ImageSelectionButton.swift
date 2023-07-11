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

struct ImageSelectionButtonFactory {
    static func createCircleButton(image: UIImage?, onImageSelected: @escaping (UIImage) -> Void, width: CGFloat? = nil, height: CGFloat? = nil, borderColor: Color = .white, borderWidth: CGFloat = 4.0) -> ImageSelectionButton {
        ImageSelectionButton(image: image, placeholderSystemImage: "person.circle", onImageSelected: onImageSelected, shape: .circle, width: width, height: height, offset: CGSize(width: 30, height: 30), borderColor: borderColor, borderWidth: borderWidth)
    }

    static func createSquareButton(image: UIImage?, onImageSelected: @escaping (UIImage) -> Void, width: CGFloat? = nil, height: CGFloat? = nil) -> ImageSelectionButton {
        ImageSelectionButton(image: image, placeholderSystemImage: "photo", onImageSelected: onImageSelected, shape: .square, width: width, height: height, offset: CGSize(width: (width ?? 0) - 250, height: 110), borderColor: .white, borderWidth: 2.0)
    }
}

struct ImageSelectionButton: View {
    let image: UIImage?
    let placeholderSystemImage: String
    let onImageSelected: (UIImage) -> Void
    let shape: ImageShape
    let width: CGFloat?
    let height: CGFloat?
    let offset: CGSize
    let borderColor: Color
    let borderWidth: CGFloat

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
                        .overlay(Circle().stroke(borderColor, lineWidth: borderWidth))
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
                Image(systemName: placeholderSystemImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width ?? UIScreen.main.bounds.width, height: height ?? UIScreen.main.bounds.height)
                    .padding()
            }
            Button(action: {
                showingActionSheet = true
            }) {
                Image(systemName: "camera")
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .clipShape(Circle())
            }
            .offset(offset)
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
