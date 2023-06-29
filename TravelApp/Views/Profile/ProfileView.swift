//
//  ProfileView.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 21/06/23.
//

import SwiftUI
import os
import SwiftData

struct ProfileView: View {
    @Query var profiles: [Profile]  // Fetches all profiles
    @State private var profile: Profile?  // State for the first profile
    
    private let logger = Logger(subsystem: "Profile", category: String(describing: ProfileView.self))
    
    @State private var countries: [Country] = []
    
    private let countryFetcher = CountryFetcher()
    
    @State private var isShowingSheet = false
    
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .bottomLeading) {
                    if let bannerImageData = profile?.bannerImage, let bannerImage = UIImage(data: bannerImageData) {
                        Image(uiImage: bannerImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipped()
                            .edgesIgnoringSafeArea(.top)
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipped()
                            .edgesIgnoringSafeArea(.top)
                    }
                    
                    HStack {
                        if let imageData = profile?.image, let image = UIImage(data: imageData) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                                .padding([.bottom, .leading], 40)
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                                .padding([.bottom, .leading], 40)
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: EditProfileView(profile: $profile.toUnwrapped(defaultValue: Profile()))) {
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
                                    HStack {
                Button(action: {
                    // Show settings sheet
                    self.isShowingSheet = true
                }) {
                    Image(systemName: "gearshape")
                        .font(.system(size: 20))
                        .foregroundColor(.purple)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                }
            }
            )
            .sheet(isPresented: $isShowingSheet) {
                SettingsView()
            }
        }
        .onAppear {
            setProfile()
        }
    }
    
    func setProfile () {
        if let firstProfile = profiles.first {
            profile = firstProfile
        } else {
            profile = Profile()
            modelContext.insert(profile!)
        }
    }
}
