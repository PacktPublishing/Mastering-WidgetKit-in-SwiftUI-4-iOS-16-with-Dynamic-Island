//
//  Stock.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 11/28/22.
//

import Foundation

struct Stock: Codable {
    let stockOpen, high, low, current, previousClose: Double
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case stockOpen = "open"
        case high, low, current
        case previousClose = "previous_close"
        case name
    }
}
