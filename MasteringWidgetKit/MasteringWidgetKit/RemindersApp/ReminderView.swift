//
//  ReminderView.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 11/16/22.
//

import SwiftUI

struct ReminderView: View {
    
    @State private var reminders = [Reminder]()
    @State private var newReminder = ""
    
    @AppStorage(RemindersAppConstant.storageKey, store: UserDefaults(suiteName: RemindersAppConstant.appGroupName))
    private var reminderStorage: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                List(reminders) { reminder in
                    VStack(alignment: .leading) {
                        Text(reminder.title)
                            .font(.title)
                        
                        Text("Due on: " + reminder.dueOn.formatted(date: .abbreviated, time: .omitted))
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
                
                TextField("Add new reminder", text: $newReminder)
                    .onSubmit {
                        if !newReminder.isEmpty {
                            let reminder = Reminder(title: newReminder, dueOn: Date())
                            
                            reminders.append(reminder)
                            
                            newReminder = ""
                            
                            reminderStorage = reminders.count
                            RemindersAppConstant.reloadReminderTimelines()
                        }
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            .navigationTitle("DevTechie Reminders")
        }
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}
