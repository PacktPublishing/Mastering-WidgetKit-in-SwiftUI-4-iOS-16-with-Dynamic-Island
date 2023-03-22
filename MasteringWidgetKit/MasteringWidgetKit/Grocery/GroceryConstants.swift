//
//  GroceryConstants.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 11/18/22.
//

import Foundation
import SwiftUI
import WidgetKit

struct GroceryConstants {
    static let appGroupContainerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.devtechie.group4widget")!
    
    static var randomColor: Color {
        Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
    
    static var widgetKind = "com.devTechie.groceryWidget"
    static func reloadGroceryTimelines() {
        WidgetCenter.shared.reloadTimelines(ofKind: Self.widgetKind)
    }
}
