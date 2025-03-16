//
//  Item.swift
//  CountDownTimerApp
//
//  Created by Suher Nurhusien on 2025-03-16.
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
