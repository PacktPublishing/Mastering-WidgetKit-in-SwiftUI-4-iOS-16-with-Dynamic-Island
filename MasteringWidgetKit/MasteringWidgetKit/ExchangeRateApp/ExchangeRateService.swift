//
//  ExchangeRateService.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 11/24/22.
//

import Foundation

struct ExchangeRateService {
    func getCurrentRate(from: String, to: String, amount: Int) async throws -> ExchangeRate {
        let urlString = "https://api.exchangerate.host/convert?from=\(from)&to=\(to)&amount=\(amount)"
        guard let url = URL(string: urlString) else {
            fatalError("Missing URL")
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error while fetching the data")
        }
        let rateResponse = try JSONDecoder().decode(ExchangeRate.self, from: data)
        return rateResponse
    }
}
