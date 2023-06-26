//
//  PickersView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 23.06.23.
//

import SwiftUI

struct PickersView: View {
    @State var selectedPicker: PickerType = .all
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(PickerType.allCases, id: \.self) { picker in
                    PickerView(picker: picker, selectedPicker: $selectedPicker)
                }
            }
        }
        .scrollIndicators(.hidden)
        .scrollClipDisabled()
    }
}

#Preview {
    PickersView()
}
