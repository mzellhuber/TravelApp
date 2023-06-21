//
//  ProfileView.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 21/06/23.
//

import SwiftUI
import os

struct ProfileView: View {
    @State private var profile: Profile? // Optional profile
    
    private let logger = Logger(subsystem: "Profile", category: String(describing: ProfileView.self))
    
    @State private var countries: [Country] = []
    
    private let countryFetcher = CountryFetcher()
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .bottomLeading) {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                        .edgesIgnoringSafeArea(.top)
                    
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                            .padding()
                        
                        Spacer()
                        
                        NavigationLink(destination: EditProfileView(profile: profile)) {
                            Image(systemName: "pencil")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.purple)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.trailing, 20)
                }
                
                Text(profile?.name ?? "Name Not Set")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding(.top, 50)
                
                Text(profile?.email ?? "Email Not Set")
                    .font(.title2)
                    .padding(.top, 10)
                
                Text("\(profile?.city ?? "City Not Set"), \(profile?.country ?? "Country Not Set")")
                    .font(.title2)
                    .padding(.top, 10)
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                // Show settings view
            }) {
                Image(systemName: "gearshape")
                    .font(.system(size: 20))
                    .foregroundColor(.purple)
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
            }
            )
        }
    }
    
    private func loadProfile() -> Profile {
        // Load the profile from storage
        // Return a default profile if none exists
        // Example implementation:
        return Profile()
    }
}

#Preview {
    ProfileView()
}
