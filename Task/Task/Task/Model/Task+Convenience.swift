//
//  Task+Convenience.swift
//  Task
//
//  Created by Hunter McNeil on 6/11/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation

extension Task {
    
    @discardableResult
    convenience init(name: String, notes: String? = nil, due: Date? = nil) {
    
    self.init(context: CoreDataStack.context)
        self.name = name
        self.notes = notes
        self.due = due
}
}
