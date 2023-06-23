//
//  PickerView.swift
//  TravelApp
//
//  Created by Mariam Babutsidze on 23.06.23.
//

import SwiftUI

struct PickerView: View {
    let picker: Picker
    
    var body: some View {
        Button {
            
        } label: {
            Text(picker.rawValue)
        }
        .tint(.gray)
    }
}

#Preview {
    PickerView(picker: .all)
}

enum Picker: String, CaseIterable {
    case all = "All"
    case popular = "Popular"
    case recommended = "Recommended"
    case mostViews = "Most Viewd"
    case recent = "Recent"
}