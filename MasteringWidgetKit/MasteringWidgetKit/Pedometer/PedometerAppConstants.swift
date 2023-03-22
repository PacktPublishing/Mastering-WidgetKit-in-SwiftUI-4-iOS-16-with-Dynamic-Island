//
//  PedometerAppConstants.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 12/5/22.
//

import SwiftUI
import WidgetKit

struct PedometerAppConstants {
    static var stepsStorageKey = "totalSteps"
    static var appGroupName = "group.com.devtechie.group4widget"
    
    static var widgetKind = "com.devtechie.pedometerWidget"
    static func reloadPedometerTimelines() {
        WidgetCenter.shared.reloadTimelines(ofKind: Self.widgetKind)
    }
}
