//
//  TripDetailView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 29.06.23.
//

import SwiftUI

struct TripDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let trip: Trip
    @State var selectedImage: UIImage?
    
    var body: some View {
        ZStack {
            VStack {
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 2/3, alignment: .center)
                        .scaledToFill()
                        .ignoresSafeArea()
                }
                Spacer()
            }
            if let _ = selectedImage {
                TripImagesView(selectedImage: $selectedImage, images: trip.details.images.compactMap { UIImage(data: $0) })
                    .padding(.bottom, UIScreen.main.bounds.height * 1/4)
            }
        }
        .sheet(isPresented: .constant(true)) {
            InfoView(trip: trip)
                .presentationCornerRadius(40)
                .presentationDetents([.medium, .large])
                .interactiveDismissDisabled()
                .presentationBackgroundInteraction(.enabled)
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            Image(systemName: "arrow.backward.circle.fill")
                .foregroundColor(.white)
        }, trailing: Button(action : {
            
        }){
            Image(systemName: "heart.circle.fill")
                .foregroundColor(.white)
        })
        .onAppear {
            if let data = trip.details.images.first,
               let uiImage = UIImage(data: data) {
                selectedImage = uiImage
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
