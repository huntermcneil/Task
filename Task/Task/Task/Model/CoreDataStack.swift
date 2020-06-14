//
//  CoreDataStack.swift
//  Task
//
//  Created by Hunter McNeil on 6/11/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Task") // <-- Change name
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    } ()
    
    static var context: NSManagedObjectContext { return container.viewContext }
}
