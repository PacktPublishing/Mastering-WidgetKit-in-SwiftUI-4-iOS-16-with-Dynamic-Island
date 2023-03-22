//
//  StockView.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 11/28/22.
//

import SwiftUI

struct StockView: View {
    
    @State private var stock: Stock?
    
    var body: some View {
        VStack(alignment: .leading) {
            if let stock = stock {
                Text("AAPL")
                    .bold()
                
                Text("\(stock.name)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(stock.current.formatted(.currency(code: "USD")))
                    .font(.title2.bold())
                    .foregroundStyle(stock.current < stock.previousClose ? Color.red.gradient : Color.green.gradient)
            } else {
                Text("Nothing to see here")
            }
        }
        .onAppear {
            Task {
                do {
                    let fetchedStock = try await StockService.getStockData(for: "AAPL")
                    stock = fetchedStock
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView()
    }
}
