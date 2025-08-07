// BillManager

import Foundation

struct Bill: Codable, Identifiable {
    let id: UUID
    var amount: Double?
    var dueDate: Date?
    var paidDate: Date?
    var payee: String?
    var remindDate: Date?
    
    init(id: UUID = UUID()) {
        self.id = id
    }
}

extension Bill: Equatable {
    static func ==(_ lhs: Bill, _ rhs: Bill) -> Bool {
        return lhs.id == rhs.id
    }
}
