//
//  StockService.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 11/28/22.
//

import Foundation

struct StockService {
    static func getStockData(for symbol: String) async throws -> Stock {
        guard let url = URL(string: "https://api.lil.software/stocks?symbol=\(symbol)") else {
            fatalError("Invalid URL")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            fatalError("Invalid response")
        }
        
        return try JSONDecoder().decode(Stock.self, from: data)
    }
}
