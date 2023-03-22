//
//  Reminder.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 11/16/22.
//

import Foundation

struct Reminder: Identifiable {
    let id = UUID()
    var title: String
    var dueOn: Date
}
