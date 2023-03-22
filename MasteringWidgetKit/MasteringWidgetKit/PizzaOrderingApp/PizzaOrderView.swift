//
//  PizzaOrderView.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 12/25/22.
//

import ActivityKit
import SwiftUI

struct PizzaOrderView: View {
    @State private var currentID: String = ""
    @State private var pizzaType: PizzaType = .cheese
    @State private var quantity: Int = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Picker("Pizza Type", selection: $pizzaType) {
                        ForEach(PizzaType.allCases) { pizzaT in
                            Text(pizzaT.rawValue)
                                .tag(pizzaT)
                        }
                    }
                    
                    Stepper.init("Quantity", value: $quantity, in: 1...10)
                    
                    Section(header: Text("Summary")) {
                        Text("Order \(quantity) Large \(pizzaType.rawValue) Pizza(s)")
                        HStack {
                            Spacer()
                            Button("Place order") {
                                placeOrder(orderString: "\(quantity) Large \(pizzaType.rawValue) Pizza(s)")
                            }
                        }
                    }
                    
                    if !currentID.isEmpty {
                        Section(header: Text("Admin Section")) {
                            Button("Update order in progress") {
                                updateOrder(with: .inProgress)
                            }
                            .frame(width: 400)
                            
                            Button("Update order in oven") {
                                updateOrder(with: .inOven)
                            }
                            .frame(width: 400)
                            
                            Button("Update order on the way") {
                                updateOrder(with: .onTheWay)
                            }
                            .frame(width: 400)
                            
                            Button("Complete order") {
                                orderCompleted()
                            }
                            .frame(width: 400)
                        }
                    }
                }
            }
            .navigationTitle("DevTechie Pizza Shop")
        }
    }
    
    private func getActivity(from id: String) -> Activity<PizzaOrderAttributes>? {
        guard let activity = Activity.activities.first(where: { (activity: Activity<PizzaOrderAttributes>) in
            activity.id == currentID
        }) else { return nil }
        return activity
    }
    
    private func placeOrder(orderString: String) {
        let pizzaOrderAttrs = PizzaOrderAttributes(orderNumber: Int.random(in: 1000..<8888), orderedItem: orderString)
        
        let state = PizzaOrderAttributes.ContentState(status: .received)
        
        do {
            let activity = try Activity<PizzaOrderAttributes>.request(attributes: pizzaOrderAttrs, contentState: state, pushType: nil)
            currentID = activity.id
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func updateOrder(with status: OrderStatus) {
        guard let activity = getActivity(from: currentID) else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            var updateState = activity.contentState
            updateState.status = status
            
            Task {
                await activity.update(using: updateState)
            }
        }
    }
    
    private func orderCompleted() {
        guard let activity = getActivity(from: currentID) else { return }
        Task {
            await activity.end(using: activity.contentState, dismissalPolicy: .immediate)
            currentID = ""
        }
    }
}
