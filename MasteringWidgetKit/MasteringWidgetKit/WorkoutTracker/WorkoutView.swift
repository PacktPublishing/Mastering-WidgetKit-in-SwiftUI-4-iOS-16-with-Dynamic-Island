//
//  WorkoutView.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 11/16/22.
//

import Charts
import SwiftUI

struct WorkoutView: View {
    var workoutData = Workout.sample
    var showLineChart = true
    
    var body: some View {
        VStack {
            Text("Workout Tracker")
                .font(.subheadline)
                
            Chart(workoutData) { workout in
                if showLineChart {
                    AreaMark(x: .value("Day", workout.day),
                             y: .value("Mins", workout.minutes))
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(Gradient(colors: [.blue.opacity(0.3), .clear]))
                    
                    LineMark(x: .value("Day", workout.day),
                             y: .value("Mins", workout.minutes))
                    .interpolationMethod(.catmullRom)
                    
                    PointMark(x: .value("Day", workout.day),
                              y: .value("Mins", workout.minutes))
                    .annotation(position: .leading) {
                        Text(workout.minutes.formatted())
                            .font(.caption2)
                    }
                } else {
                    BarMark(x: .value("Day", workout.day),
                            y: .value("Mins", workout.minutes))
                    .foregroundStyle(by: .value("Day", workout.day))
                    .annotation {
                        Text("\(workout.minutes) mins")
                            .font(.caption2)
                    }
                }
            }
        }
        .padding()
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WorkoutView()
            WorkoutView(showLineChart: false)
        }
    }
}
