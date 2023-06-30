//
//  TripDetailView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 29.06.23.
//

import SwiftUI

struct TripDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let tripDetail: TripDetail
    @State var selectedImage: ImageResource = ImageResource(name: "forest", bundle: Bundle.main)
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(selectedImage)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: geo.size.width, height: geo.size.height * 2/3, alignment: .center)
                TripImagesView(selectedImage: $selectedImage, images: tripDetail.images)
            }
            .sheet(isPresented: .constant(true)) {
                InfoView(tripDetail: tripDetail)
                    .presentationCornerRadius(40)
                    .presentationDetents([.medium, .large])
                    .interactiveDismissDisabled()
                    .presentationBackgroundInteraction(.enabled)
            }
        }
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
            selectedImage = tripDetail.images.first!
        }
    }
}

#Preview {
    TripDetailView(tripDetail: .init(id: 4,
                                     title: "Tiveden",
                                     location: "Sweden",
                                     rating: "4.2",
                                     images: [ImageResource(name: "forest", bundle: Bundle.main)],
                                     description: "New"))
}
