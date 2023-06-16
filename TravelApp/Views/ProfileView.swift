import SwiftUI

struct ProfileView: View {
    @State private var isLoggedin: Bool = false
    @State private var userName: String = "John Doe" // Placeholder name
    @State private var userEmail: String = "user@example.com" // Placeholder email
    @State private var userImage: Image = Image(systemName: "person.crop.circle.fill") // Placeholder image
    @State private var bannerImage: Image = Image(systemName: "photo") // Placeholder image
    @State private var userLocation: String = "🇺🇸 San Francisco" // Placeholder location
    @State private var showLoginView: Bool = false
    @State private var showSettingsView: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .bottomLeading) {
                    // Display the banner image
                    bannerImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                        .edgesIgnoringSafeArea(.top)

                    // Display the user's image
                    userImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .offset(x: 20, y: -70)
                        .padding(.bottom, -50)
                }

                // Display the user's name
                Text(userName)
                    .font(.largeTitle)
                    .fontWeight(.medium) // Set font weight to medium
                    .padding(.top, 50)

                // Display the user's email
                Text(userEmail)
                    .font(.title2)
                    .padding(.top, 10)

                // Display the user's location
                Text(userLocation)
                    .font(.title2)
                    .padding(.top, 10)

                // Display the Login/Logout button
                Button(action: {
                    if isLoggedin {
                        // TODO: Perform logout action
                        isLoggedin = false
                    } else {
                        showLoginView = true
                    }
                }) {
                    Text(isLoggedin ? "Logout" : "Login")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                }
                .sheet(isPresented: $showLoginView) {
                    // TODO: Display the login view
                }
                .padding(.top, 20)
                .padding(.horizontal, 40)

                Spacer()
            }
            .onAppear {
                // TODO: Check if the user is already logged in and update isLoggedin
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showSettingsView = true
                    }) {
                        Image(systemName: "gearshape")
                            .foregroundColor(Color.purple)
                            .padding(10)
                    }
                    .sheet(isPresented: $showSettingsView) {
                        // TODO: Display the settings view
                    }
                }
            }
            .accentColor(.black) // Set the color of the navigation bar title and toolbar items to black
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
