//
//  PickerView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 23.06.23.
//

import SwiftUI

struct PickerView: View {
    let picker: PickerType
    @Binding var selectedPicker: PickerType
    
    var body: some View {
        Button {
            selectedPicker = picker
        } label: {
            Text(picker.rawValue)
        }
        .tint(selectedPicker == picker ? .black : .gray)
    }
}

#Preview {
    PickerView(picker: .all, selectedPicker: .constant(.all))
}

enum PickerType: String, CaseIterable {
    case all = "All"
    case popular = "Popular"
    case recommended = "Recommended"
    case mostViews = "Most Viewd"
    case recent = "Recent"
}
