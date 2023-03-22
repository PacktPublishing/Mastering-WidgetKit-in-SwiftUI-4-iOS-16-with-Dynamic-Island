//
//  PizzaOrderAttributes.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 12/21/22.
//

import ActivityKit
import SwiftUI

enum OrderStatus: String, CaseIterable, Codable, Equatable {
    case received = "takeoutbag.and.cup.and.straw.fill"
    case inProgress = "hourglass"
    case inOven = "flame.fill"
    case onTheWay = "car.fill"
}

struct PizzaOrderAttributes: ActivityAttributes {
    
    struct ContentState: Codable, Hashable {
        var status: OrderStatus = .received
    }
    
    var orderNumber: Int
    var orderedItem: String
}
