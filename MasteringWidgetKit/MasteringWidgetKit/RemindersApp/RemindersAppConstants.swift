//
//  RemindersAppConstants.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 11/16/22.
//

import WidgetKit

struct RemindersAppConstant {
    static var storageKey = "totalReminders"
    static var appGroupName = "group.com.devtechie.group4widget"
    
    static var widgetKind = "com.devTechie.reminderWidget"
    static func reloadReminderTimelines() {
        WidgetCenter.shared.reloadTimelines(ofKind: Self.widgetKind)
    }
}
