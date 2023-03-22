//
//  MasteringWidgetKitApp.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 11/3/22.
//

import SwiftUI

@main
struct MasteringWidgetKitApp: App {
    var body: some Scene {
        let managedContext = CoreDataManager.shared.managedObjectContext
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, managedContext)
        }
    }
}
