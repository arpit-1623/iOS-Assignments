//
//  Task.swift
//  ToDoList
//
//  Created by Arpit Garg on 06/11/25.
//

import Foundation

struct Task: Equatable, Codable {
    var id: UUID
    var name: String
    var date: Date
    var isComplete: Bool
    
    static func ==(lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func sampleTasks() -> [Task] {
        let samples = [
            Task(id: UUID(), name: "Task 1", date: Date(), isComplete: false),
            Task(id: UUID(), name: "Task 2", date: Date(), isComplete: true),
            Task(id: UUID(), name: "Task 3", date: Date(), isComplete: false)
        ]
        
        return samples
    }
}

let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let url = documentDirectory.appendingPathComponent("tasks_data").appendingPathExtension("json")

func saveTasks(tasks: [Task]) {
    let jsonEncoder = JSONEncoder()
    let encodedData = try? jsonEncoder.encode(tasks)
    try? encodedData?.write(to: url)
}

func loadTasks() -> [Task]? {
    let jsonDecoder = JSONDecoder()
    guard let encodedData = try? Data(contentsOf: url) else { return nil }
    return try? jsonDecoder.decode([Task].self, from: encodedData)
}
