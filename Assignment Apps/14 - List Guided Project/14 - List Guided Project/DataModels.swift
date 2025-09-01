//
//  DataModels.swift
//  14 - List Guided Project
//
//  Created by Arpit Garg on 01/09/25.
//

import Foundation

struct Task: Equatable, Codable  {
    let id: UUID
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentDirectory.appendingPathComponent("tasks").appendingPathExtension("plist")
    
    init(title: String, isComplete: Bool, dueDate: Date, notes: String? = nil) {
        self.id = UUID()
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
    }
    
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func saveTasks(_ tasks: [Task]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedTasks = try? propertyListEncoder.encode(tasks)
        try? codedTasks?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadTasks() -> [Task]? {
        guard let codedTasks = try? Data(contentsOf: archiveURL) else {
            return nil
        }
        
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode([Task].self, from: codedTasks)

    }
    
    static func loadSampleTasks() -> [Task] {
        let task1 = Task(
            title: "Sample Task 1",
            isComplete: false,
            dueDate: Date(),
            notes: "Notes for Task 1"
        )
        
        let task2 = Task(
            title: "Sample Task 2",
            isComplete: false,
            dueDate: Date(),
            notes: "Notes for Task 2"
        )
        
        let task3 = Task(
            title: "Sample Task 3",
            isComplete: false,
            dueDate: Date(),
            notes: "Notes for Task 3"
        )
        
        return [task1, task2, task3]
    }
}

var tasks: [Task]  = []
