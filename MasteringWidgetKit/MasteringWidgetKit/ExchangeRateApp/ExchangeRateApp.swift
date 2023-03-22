//
//  ExchangeRateApp.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 11/26/22.
//

import SwiftUI

struct ExchangeRateApp: View {
    
    @State private var selectedCountry: Country? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                List(Country.sample) { country in
                    CountryListCell(country: country)
                        .onTapGesture {
                            selectedCountry = country
                        }
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .sheet(item: $selectedCountry) { country in
                    CountryExchangeRateView(country: country)
                }
            }
            .navigationTitle("DevTechie")
            .onOpenURL { url in
                guard
                    url.scheme == "devtechie",
                    url.host == "exchangerate" else {
                    return
                }
                
                //print(url.pathComponents)
                
                selectedCountry = Country.sample.first(where: { c in c.currencyCode == url.pathComponents[1]})
            }
        }
    }
}

struct ExchangeRateApp_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRateApp()
    }
}
