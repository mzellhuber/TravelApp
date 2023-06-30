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
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Image(trip.imageName)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: geo.size.width, height: geo.size.height * 2/3, alignment: .center)
            }
            .sheet(isPresented: .constant(true)) {
                InfoView(trip: trip)
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
    }
}

#Preview {
    TripDetailView(trip: .init(title: "Avanada Logo", location: "Thailand", rating: "4.9", imageName: ImageResource(name: "mountains", bundle: Bundle.main)))
}
