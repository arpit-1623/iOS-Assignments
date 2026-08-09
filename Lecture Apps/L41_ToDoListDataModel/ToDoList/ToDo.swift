import Foundation

struct ToDo: Equatable, Codable {
    let id: UUID
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    init(title: String, isComplete: Bool, dueDate: Date, notes: String?) {
        self.id = UUID()
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
    }
    
    static func ==(lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
}

class ToDoDataModel {
    
    static let shared = ToDoDataModel()
    
    private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    private let archiveURL: URL
    
    private var toDos: [ToDo] = []
    
    private init() {
        archiveURL = documentsDirectory.appendingPathComponent("toDos").appendingPathExtension("plist")
        loadToDos()
    }
    
    // MARK: - Public Methods
    
    func getAllToDos() -> [ToDo] {
        return toDos
    }
    
    func addToDo(_ toDo: ToDo) {
        toDos.append(toDo)
        saveToDos()
    }
    
    func updateToDo(_ toDo: ToDo) {
        if let index = toDos.firstIndex(where: { $0.id == toDo.id }) {
            toDos[index] = toDo
            saveToDos()
        }
    }
    
    func deleteToDo(at index: Int) {
        toDos.remove(at: index)
        saveToDos()
    }
    
    
    // MARK: - Private Methods
    
    private func loadToDos() {
        if let savedToDos = loadToDosFromDisk() {
            toDos = savedToDos
        } else {
            toDos = loadSampleToDos()
        }
    }
    
    private func loadToDosFromDisk() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else { return nil }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode([ToDo].self, from: codedToDos)
    }
    
    private func saveToDos() {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(toDos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    private func loadSampleToDos() -> [ToDo] {
        let toDo1 = ToDo(title: "To-Do One", isComplete: false, dueDate: Date(), notes: "Notes 1")
        let toDo2 = ToDo(title: "To-Do Two", isComplete: false, dueDate: Date(), notes: "Notes 2")
        let toDo3 = ToDo(title: "To-Do Three", isComplete: false, dueDate: Date(), notes: "Notes 3")
        return [toDo1, toDo2, toDo3]
    }
}
