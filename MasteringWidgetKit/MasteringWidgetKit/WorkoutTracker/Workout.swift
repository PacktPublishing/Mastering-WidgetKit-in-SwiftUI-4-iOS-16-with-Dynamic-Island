//
//  Workout.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 11/16/22.
//

import Foundation

struct Workout: Identifiable {
    let id = UUID()
    let day: String
    let minutes: Int
}

extension Workout {
    static var sample: [Workout] {
        [
            .init(day: "Mon", minutes: Int.random(in: 20..<60)),
            .init(day: "Tue", minutes: Int.random(in: 20..<60)),
            .init(day: "Wed", minutes: Int.random(in: 20..<60)),
            .init(day: "Thu", minutes: Int.random(in: 20..<60)),
            .init(day: "Fri", minutes: Int.random(in: 20..<60)),
            .init(day: "Sat", minutes: Int.random(in: 20..<60)),
            .init(day: "Sun", minutes: Int.random(in: 20..<60)),
        ]
    }
}
