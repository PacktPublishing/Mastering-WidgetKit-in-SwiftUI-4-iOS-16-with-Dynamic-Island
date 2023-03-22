//
//  PizzaType.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 12/21/22.
//

import Foundation

enum PizzaType: String, Identifiable, CaseIterable {
case cheese = "Cheese"
    case chicken = "Chicken"
    case hawaiian = "Hawaiian"
    case neapolitan = "Neapolitan"
    case chicago = "Chicago"
    case newYork = "New York"
    case sicilian = "Sicilian"
    case greek = "Greek"
    case california = "California"
    
    var id: UUID {
        return UUID()
    }
}
