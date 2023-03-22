//
//  CountryExchangeRateView.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 11/25/22.
//

import SwiftUI

struct CountryExchangeRateView: View {
    
    var country: Country
    
    @State private var currentRate = 0.0
    
    var body: some View {
        VStack {
            Text("\(country.flag) \(country.name)")
                .font(.largeTitle)
            
            HStack {
                VStack {
                    HStack {
                        Text(Country.USA.flag)
                        Text(Country.USA.currencyCode)
                    }
                    Text(1.0.formatted(.currency(code: "USD")))
                }
                
                Spacer()
                
                Image(systemName: "arrow.left.arrow.right")
                
                Spacer()
                
                VStack {
                    HStack {
                        Text(country.currencyCode)
                        Text(country.flag)
                    }
                    Text(currentRate.formatted(.currency(code: country.currencyCode)))
                }
            }
            .font(.largeTitle)
            .onAppear {
                Task {
                    do {
                        let exchangeRate = try await ExchangeRateService().getCurrentRate(from: Country.USA.currencyCode, to: country.currencyCode, amount: 1)
                        currentRate = exchangeRate.result
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        .padding()
    }
}

struct CountryExchangeRateView_Previews: PreviewProvider {
    static var previews: some View {
        CountryExchangeRateView(country: Country.sample[0])
    }
}
