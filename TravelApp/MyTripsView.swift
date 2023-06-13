//
//  MyTripsView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 13.06.23.
//

import SwiftUI
// just for testing
struct MyTripsView: View {
    @State var bounceValue: Int = 0
    var body: some View {
        VStack {
            Image(systemName: "antenna.radiowaves.left.and.right")
                .symbolEffect(
                    .bounce,
                    options: .repeat(2),
                    value: bounceValue
                )
            
            Button("Animate") {
                bounceValue += 1
            }
        }
        
    }
}

#Preview {
    MyTripsView()
}
