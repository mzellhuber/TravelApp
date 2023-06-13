//
//  Item.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 13/06/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
