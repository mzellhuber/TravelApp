//
//  ProfileView.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 21/06/23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .bottomLeading) {
                    if let bannerImageData = viewModel.profile?.bannerImage, let bannerImage = UIImage(data: bannerImageData) {
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
                        if let imageData = viewModel.profile?.image, let image = UIImage(data: imageData) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                                .offset(y: -40)
                                .padding(.leading, 40)
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                                .offset(y: -40)
                                .padding(.leading, 40)
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: EditProfileView(profile: Binding<Profile>(
                            get: { viewModel.profile ?? Profile() },
                            set: { newValue in viewModel.profile = newValue }))) {
                            Image(systemName: "pencil")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.purple)
                                .clipShape(Circle())
                        }
                        .offset(y: -20) // Move image down
                    }
                    .padding(.trailing, 20)
                    .background(Color.white) // Add a background to hide the lower part of the banner
                }
                
                Text(viewModel.profile?.name ?? "Name Not Set")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding(.top, 50)
                
                Text(viewModel.profile?.email ?? "Email Not Set")
                    .font(.title2)
                    .padding(.top, 10)
                
                Text("\(viewModel.profile?.city ?? "City Not Set"), \(viewModel.profile?.country ?? "Country Not Set")")
                    .font(.title2)
                    .padding(.top, 10)
                
                Spacer()
                
                VStack {
                    Divider() // Separator
                    
                    NavigationLink(destination: AddTripView(), isActive: $viewModel.isAddingTrip) {
                        EmptyView()
                    }
                    
                    Button(action: {
                        // Start adding a new trip
                        viewModel.addTrip()
                    }) {
                        HStack {
                            Image(systemName: "plus") // Plus sign
                                .foregroundColor(.white)
                                .font(.title)
                            
                            Text("Add Trip")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)
                    }
                    .padding(.horizontal, 20)
                    
                    Divider() // Separator
                }
                .padding(.bottom, 20)
                
                MyTripsView()
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    HStack {
                Button(action: {
                    // Show settings sheet
                    viewModel.toggleSheet()
                }) {
                    Image(systemName: "gearshape.circle.fill")
                        .foregroundColor(.white)
                }
            }
            )
            .sheet(isPresented: $viewModel.isShowingSheet) {
                SettingsView()
            }
        }
        .onAppear {
            viewModel.setProfile()
        }
    }
}
