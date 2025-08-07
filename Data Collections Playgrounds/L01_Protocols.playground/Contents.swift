/*
 Define a blueprint of methods, properties, and other requirements that suit a particular task or functionality.

 - CustomStringConvertible, Equatable, Comparable, Codable
 - When adopt, need to implement all methods
 
 - Adopting a Protocol: ex - "class <N> : <Protocol>"
 - Confirming a Protcol: Implementing the properites, methods of the protocol
 */

//class Shoe {
//    let color: String
//    let size: Int
//    let hasLaces: Bool
//    
//    init(color: String, size: Int, hasLaces: Bool) {
//        self.color = color
//        self.size = size
//        self.hasLaces = hasLaces
//    }
//}

let myShoe = Shoe(color: "Black", size: 12, hasLaces: true)
print(myShoe)

// Output: __lldb_expr_17.Shoe

// # Custom String Convertible (Pretty Print for Instances)

class Shoe: CustomStringConvertible {
    let color: String
    let size: Int
    let hasLaces: Bool

    init(color: String, size: Int, hasLaces: Bool) {
        self.color = color
        self.size = size
        self.hasLaces = hasLaces
    }
    
    // Property from CustomStringConvertible
    var description: String {
        return "Shoe(color: \(color), size: \(size), hasLaces: \(hasLaces))"
    }
}

// Output after CustomStringConvertible: Shoe(color: Black, size: 12, hasLaces: true)
// CustomStringConvertible - Provide printable custom string format for object printing. Useful for debugging, works with struct, class, enum

// Example Queastion

//struct Book: CustomStringConvertible {
//    var title: String
//    var author: String
//    
//    var description: String {
//        return "\(title) by \(author)"
//    }
//}
//
//struct BookWithoutProtocol {
//    var title: String
//    var author: String
//}

class Book: CustomStringConvertible {
    var title: String
    var author: String
    
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
    
    var description: String {
        return "\(title) by \(author)"
    }
}

class BookWithoutProtocol {
    var title: String
    var author: String
    
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
}

var book = Book(title: "ABC", author: "123")
print(book)

var bookWithoutProtocol = BookWithoutProtocol(title: "ABC", author: "123")
print(bookWithoutProtocol) // __lldb_expr_263.BookWithoutProtocol

// # Equatable (Comparing Information)
//struct Employee {
//    let firstName: String
//    let lastName: String
//    let jobTitle: String
//    let phoneNumber: String
//}

//struct Employee: Equatable {
//    let firstName: String
//    let lastName: String
//    let jobTitle: String
//    let phoneNumber: String
//    
//    
//    // By default the equatable protocol, compares all of the properties of the structure
//    static func == (lhs: Employee, rhs: Employee) -> Bool {
//        return
//            lhs.firstName == rhs.firstName &&
//            lhs.lastName == rhs.lastName
//    }
//}

struct Company {
    let name: String
    let employees: [Employee]
}

let currentEmployee = Employee(firstName: "A", lastName: "B", jobTitle: "C", phoneNumber: "D")
let otherEmployee = Employee(firstName: "A", lastName: "B", jobTitle: "E", phoneNumber: "F")

if currentEmployee == otherEmployee {
    print("Both are the same Employees")
} else {
    print("Both are different Employees")
}

// Example Question
struct BookEquatable: Equatable {
    var title: String
    var author: String
    
    static func == (lhs: BookEquatable, rhs: BookEquatable) -> Bool {
        return lhs.title == rhs.title
    }
}

var sampleBook1 = BookEquatable(title: "A", author: "B")
var sampleBook2 = BookEquatable(title: "A", author: "D")

if sampleBook1 == sampleBook2 {
    print("Same Books!")
}

// # Sorting Information using Comparable

class Employee: CustomStringConvertible, Equatable, Comparable {
    var description: String {
        return firstName + " " + lastName + " " + jobTitle + " " + phoneNumber
    }
    
    let firstName: String
    let lastName: String
    let jobTitle: String
    let phoneNumber: String
    
    init(firstName: String, lastName: String, jobTitle: String, phoneNumber: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.jobTitle = jobTitle
        self.phoneNumber = phoneNumber
    }
    
    
    // By default the equatable protocol, compares all of the properties of the structure
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        return
            lhs.firstName == rhs.firstName &&
            lhs.lastName == rhs.lastName
    }
    
    static func < (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.firstName < rhs.firstName
    }
}

var comparableEmp1 = Employee(firstName: "A", lastName: "B", jobTitle: "C", phoneNumber: "D")
var comparableEmp2 = Employee(firstName: "B", lastName: "B", jobTitle: "C", phoneNumber: "D")

if (comparableEmp1 <  comparableEmp2) {
    print("Emp 1 is less than Emp 2")
}


let employee1 = Employee(firstName: "Rich", lastName: "Dinh",
jobTitle: "Senior Manager", phoneNumber: "415-555-7770" )

let employee2 = Employee(firstName: "Jenny", lastName: "Court",
jobTitle: "CEO", phoneNumber: "415-555-7768" )

let employee3 = Employee(firstName: "Jenica", lastName: "Chong",
jobTitle: "Front Desk", phoneNumber: "415-555-7767")

let employee4 = Employee(firstName: "Trev", lastName: "Smith",
jobTitle: "Sales Lead", phoneNumber: "415-555-7772")

let employee5 = Employee(firstName: "Rigo", lastName: "Rangel",
jobTitle: "Accountant", phoneNumber: "415-555-7771")

let employees = [employee1, employee2, employee3, employee4, employee5]

for employee in employees {
    print(employee)
}

let sortedEmployees = employees.sorted(by: <)
print("*-------------*")

for employee in sortedEmployees {
    print(employee)
}
