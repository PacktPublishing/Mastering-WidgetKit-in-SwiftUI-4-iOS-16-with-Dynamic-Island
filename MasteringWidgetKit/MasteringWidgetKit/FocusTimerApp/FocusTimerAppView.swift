//
//  FocusTimerAppView.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 12/19/22.
//

import ActivityKit
import SwiftUI

struct FocusTimerAppView: View {
    @State private var timerName = "DevTechie Focus Timer"
    @State private var focusTime = 20.0
    @State private var activity: Activity<FocusTimerAttributes>? = nil
    @State private var timerSet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if timerSet {
                    Text("Timer in progress!")
                } else {
                    TextField("Enter timer name", text: $timerName)
                        .textFieldStyle(.roundedBorder)
                    
                    Text("Focus time: \(focusTime.formatted())")
                        .font(.title3)
                    Stepper("Adjust Focus Time", value: $focusTime, in: 10...60, step: 5)
                }
                
                HStack {
                    Button("Start Timer") {
                        startTimer()
                    }
                    
                    Button("Stop Timer") {
                        stopTimer()
                    }
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
            }
            .padding()
            .navigationTitle("DevTechie Focus Timer")
        }
    }
    
    private func startTimer() {
        let attributes = FocusTimerAttributes(timerName: timerName)
        let state = FocusTimerAttributes.ContentState(endTime: Date().addingTimeInterval(60 * focusTime))
        
        activity = try? Activity<FocusTimerAttributes>.request(attributes: attributes, contentState: state, pushType: nil)
        
        timerSet = true
    }
    
    private func stopTimer() {
        let state = FocusTimerAttributes.ContentState(endTime: .now)
        
        Task {
            await activity?.end(using:state, dismissalPolicy: .immediate)
            timerSet = false
        }
    }
}
