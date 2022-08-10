//
//  CoreDataManager.swift
//  CoreDataExample
//
//  Created by Maarten Borsje on 10/08/2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let instance = CoreDataManager() // Singleton
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
        try context.save()
            print("Saved succesfully.")
        } catch {
            print("Error saving Core Data. \(error.localizedDescription)")
        }
    }
    
}
