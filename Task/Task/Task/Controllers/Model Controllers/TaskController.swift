//
//  TaskController.swift
//  Task
//
//  Created by Hunter McNeil on 6/11/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let shared = TaskController()
 
    var tasks: [Task] {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        Task(name: name, notes: notes, due: due)
        TaskController.shared.saveToPersistenceStore()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistenceStore()
    }
    
    func remove(task: Task) {
        task.managedObjectContext?.delete(task)
    }
    
    func saveToPersistenceStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There was an error in \(#function) : \(error) \(error.localizedDescription)")
        }
    }
}
