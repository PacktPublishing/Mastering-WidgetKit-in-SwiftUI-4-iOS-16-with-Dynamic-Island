//
//  ExchangeRate.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 11/24/22.
//

import Foundation

struct ExchangeRate: Codable {
    let success: Bool
    let query: Query
    let info: Info
    let date: String
    let result: Double
}

struct Query: Codable {
    let from, to: String
    let amount: Int
}

struct Info: Codable {
    let rate: Double
}
