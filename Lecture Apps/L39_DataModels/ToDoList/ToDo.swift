//
//  ToDo.swift
//  ToDoList
//
//  Created by Student on 16/9/2025.
//

import Foundation

// MARK: - ToDo Struct
struct ToDo: Equatable, Codable {
    let id: UUID
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?

    init(title: String, isComplete: Bool, dueDate: Date, notes: String? = nil) {
        self.id = UUID()
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
    }

    // Compare todos by unique ID
    static func == (lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - TodoDataModel Class
class TodoDataModel {
    static let shared = TodoDataModel()
    private init() {
        loadTodos()
    }
    
    private var todos: [ToDo] = []

    func getAllTodos() -> [ToDo] {
        return todos
    }

    func addTodo(_ todo: ToDo) {
        todos.append(todo)
        saveTodos()
    }

    func updateTodo(_ todo: ToDo, at index: Int) {
        todos[index] = todo
        saveTodos()
    }

    func deleteTodo(at index: Int) {
        todos.remove(at: index)
        saveTodos()
    }

    func loadSampleToDos() -> [ToDo] {
        return [
            ToDo(title: "Wash Clothing", isComplete: false, dueDate: Date(), notes: "This should be completed weekly"),
            ToDo(title: "Clean Kitchen", isComplete: false, dueDate: Date(), notes: "This should be done daily"),
            ToDo(title: "Wash Windows", isComplete: false, dueDate: Date(), notes: "This should be done quarterly")
        ]
    }

    
    private let archiveURL: URL = {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("toDos").appendingPathExtension("plist")
    }()
    
    private func saveTodos() {
        let encoder = PropertyListEncoder()
        if let data = try? encoder.encode(todos) {
            try? data.write(to: archiveURL, options: .noFileProtection)
        }
    }
    
    private func loadTodos() {
        guard let data = try? Data(contentsOf: archiveURL) else { return }
        let decoder = PropertyListDecoder()
        todos = (try? decoder.decode([ToDo].self, from: data)) ?? []
    }
}
