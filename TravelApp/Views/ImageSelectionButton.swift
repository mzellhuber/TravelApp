//
//  ImageSelectionButton.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 21/06/23.
//

import SwiftUI

struct ImageSelectionButton: View {
    let image: UIImage?
    let onImageSelected: (UIImage) -> Void

    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var imageSourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var inputImage: UIImage?

    var body: some View {
        Button(action: {
            showingActionSheet = true
        }) {
            VStack {
                Spacer()
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }
                Spacer()
            }
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
        if let inputImage = inputImage {
            onImageSelected(inputImage)
        }
    }
}
