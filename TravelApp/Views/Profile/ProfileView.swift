import SwiftUI

struct ProfileView: View {
    @State private var userName: String = "John Doe"
    @State private var userEmail: String = "user@example.com"
    @State private var userImage: Image = Image(systemName: "person.crop.circle.fill")
    @State private var bannerImage: Image = Image(systemName: "photo")
    @State private var userLocation: String = "🇺🇸 San Francisco"
    @State private var showSettingsView: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .bottomLeading) {
                    bannerImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                        .edgesIgnoringSafeArea(.top)

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

                Text(userName)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding(.top, 50)

                Text(userEmail)
                    .font(.title2)
                    .padding(.top, 10)

                Text(userLocation)
                    .font(.title2)
                    .padding(.top, 10)

                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                Button(action: {
                    showSettingsView = true
                    print("Gear icon tapped!")
                }) {
                    Image(systemName: "gearshape")
                        .font(.system(size: 20))
                        .foregroundColor(.purple)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                }
                .sheet(isPresented: $showSettingsView) {
                    SettingsView()
                }
            )
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
