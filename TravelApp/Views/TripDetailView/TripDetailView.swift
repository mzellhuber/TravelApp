//
//  TripDetailView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 29.06.23.
//

import SwiftUI

struct TripDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Image(.mountains)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: geo.size.width, height: geo.size.height/2)
                VStack {
                    Spacer()
                    HStack {
                        Text("asdasd")
                        Spacer()
                    }
                    Spacer()
                }
                .background(.white)
                .cornerRadius(40)
                .padding(.top, -60)
                .ignoresSafeArea()
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
    TripDetailView()
}
