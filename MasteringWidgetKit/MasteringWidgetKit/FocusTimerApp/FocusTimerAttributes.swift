//
//  FocusTimerAttributes.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 12/6/22.
//

import ActivityKit
import SwiftUI

struct FocusTimerAttributes: ActivityAttributes {
    
    var timerName: String
    
    public struct ContentState: Codable, Hashable {
        var endTime: Date
    }
}

