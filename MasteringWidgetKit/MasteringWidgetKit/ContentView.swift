//
//  ContentView.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 11/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PizzaOrderView()
        //FocusTimerAppView()
        //PedometerView()
        //ExchangeRateApp()
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
        //WorkoutView(showLineChart: false)
        //ReminderView()
//        GroceryView()
//            .onAppear {
//                Task {
//                    do {
//                        let exchangeRate = try await ExchangeRateService().getCurrentRate(from: Country.USA.currencyCode, to: Country.sample[0].currencyCode, amount: 1)
//                        print(exchangeRate.result.formatted())
//                    } catch {
//                        print(error.localizedDescription)
//                    }
//                }
//            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
