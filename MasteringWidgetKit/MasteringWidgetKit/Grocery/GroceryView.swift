//
//  GroceryView.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 11/21/22.
//

import CoreData
import SwiftUI

struct GroceryView: View {
    @Environment(\.managedObjectContext) private var managedContext
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    private var items: FetchedResults<Item>
    
    @State private var newItem = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List(items, id: \.id) { item in
                    HStack {
                        Color(hex: item.color ?? "#FF5733")
                            .frame(width: 5, height: 20)
                        
                        Text(item.name ?? "")
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                
                Spacer()
                
                TextField("Add new item", text: $newItem)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        saveNewItem()
                    }
            }
            .padding()
            .navigationTitle("DevTechie Grocery")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Delete All") {
                        deleteAll()
                    }
                }
            }
        }
    }
    
    private func saveNewItem() {
        if !newItem.isEmpty {
            let context = CoreDataManager.shared.managedObjectContext
            
            let item = Item(context: context)
            item.id = UUID()
            item.name = newItem
            item.color = Color.randomHexColorCode
            
            CoreDataManager.shared.saveWorkingContext(context: context)
            GroceryConstants.reloadGroceryTimelines()
            
            newItem = ""
        }
    }
    
    private func deleteAll() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try CoreDataManager.shared.managedObjectContext.execureAndMergeChanges(deleteRequest)
            
            GroceryConstants.reloadGroceryTimelines()
        } catch {
            print(error.localizedDescription)
        }
    }
}
