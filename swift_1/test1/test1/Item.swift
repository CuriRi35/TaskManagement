//
//  Item.swift
//  test1
//
//  Created by 並木　彗 on 2024/09/15.
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
