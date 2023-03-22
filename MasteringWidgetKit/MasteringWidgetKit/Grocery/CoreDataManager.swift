//
//  CoreDataManager.swift
//  MasteringWidgetKit
//
//  Created by DevTechie on 11/20/22.
//

import CoreData
import Foundation

final class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    private let persistentContainer: NSPersistentContainer = {
        let storeURL = GroceryConstants.appGroupContainerURL.appendingPathComponent("Grocery.sqlite")
        
        let container = NSPersistentContainer(name: "Grocery")
        container.persistentStoreDescriptions = [NSPersistentStoreDescription(url: storeURL)]
        container.loadPersistentStores { storeDesc, error in
            if let error = error as? NSError {
                print(error.localizedDescription)
            }
        }
        
        return container
    }()
    
    var managedObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    var managedObjectContextForSaving: NSManagedObjectContext {
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.parent = managedObjectContext
        return context
    }
    
    func saveContext() {
        managedObjectContext.performAndWait {
            if managedObjectContext.hasChanges {
                do {
                    try managedObjectContext.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func saveWorkingContext(context: NSManagedObjectContext) {
        do {
            try context.save()
            saveContext()
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension NSManagedObjectContext {
    public func execureAndMergeChanges(_ batchDeleteRequest: NSBatchDeleteRequest) throws {
        batchDeleteRequest.resultType = .resultTypeObjectIDs
        let result = try execute(batchDeleteRequest) as? NSBatchDeleteResult
        let changes: [AnyHashable: Any] = [NSDeletedObjectsKey : result?.result as? [NSManagedObjectID] ?? []]
        
        NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [self])
    }
}
