//
//  PedometerManager.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 12/5/22.
//

import CoreMotion
import SwiftUI

final class PedometerManager: ObservableObject {
    @Published var pedometer = Pedometer(steps: 0)
    
    init() {
        getData()
    }
    
    func refreshData() {
        getData()
    }
    
    // MARK:- Private props and methods
    
    private let cmPedometer: CMPedometer = CMPedometer()
    private var isPedometerAvailable: Bool {
        CMPedometer.isPedometerEventTrackingAvailable() &&
        CMPedometer.isDistanceAvailable() &&
        CMPedometer.isStepCountingAvailable()
    }
    
    private func getData() {
        if isPedometerAvailable {
            guard let startDate = Calendar.current.date(byAdding: .hour, value: -24, to: Date()) else { return }
            cmPedometer.queryPedometerData(from: startDate, to: Date()) { [weak self] data, error in
                guard let self = self, let data = data, error == nil else {
                    return
                }
                
                DispatchQueue.main.async {
                    self.pedometer.steps = data.numberOfSteps.intValue
                }
            }
        }
    }
}
