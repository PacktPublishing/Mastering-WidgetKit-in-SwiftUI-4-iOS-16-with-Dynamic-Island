//
//  PedometerView.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 12/5/22.
//

import SwiftUI

struct PedometerView: View {
    
    @AppStorage(PedometerAppConstants.stepsStorageKey, store: UserDefaults(suiteName: PedometerAppConstants.appGroupName))
    private var stepsStorage: Int = 0
    
    @StateObject private var manager = PedometerManager()
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(Color.orange.gradient)
                .frame(width: 300, height: 300)
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.gray.gradient.opacity(0.5))
                .frame(width: 250, height: 100)
            
            Text("\(manager.pedometer.steps) steps")
                .font(.custom("Academy Engraved LET", size: 44))
                .foregroundColor(.white)
        }
        .onAppear {
            manager.refreshData()
        }
        .onReceive(manager.objectWillChange) { _ in
            stepsStorage = manager.pedometer.steps
            PedometerAppConstants.reloadPedometerTimelines()
            print(stepsStorage)
        }
    }
}

struct PedometerView_Previews: PreviewProvider {
    static var previews: some View {
        PedometerView()
    }
}
