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
        ZStack {
            VStack {
                Image(selectedImage)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 2/3, alignment: .center)
                    .scaledToFill()
                    .ignoresSafeArea()
                Spacer()
            }
            TripImagesView(selectedImage: $selectedImage, images: tripDetail.images)
                .padding(.bottom, UIScreen.main.bounds.height * 1/4)
            
        }
        .sheet(isPresented: .constant(true)) {
            InfoView(tripDetail: tripDetail)
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
            selectedImage = tripDetail.images.first!
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    TripDetailView(tripDetail: .init(id: UUID(),
                                     title: "Tiveden",
                                     location: "Sweden",
                                     rating: "4.2",
                                     images: [ImageResource(name: "forest", bundle: Bundle.main)],
                                     description: "New"))
}
