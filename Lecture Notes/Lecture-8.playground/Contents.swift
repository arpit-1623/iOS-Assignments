//: # Lecture 8
//: ## Optionals
//: ### Nil

struct Book {
    var name: String
    var annoucementYear: Int? // Optional Int
}

let firstBook = Book(name: "First Book", annoucementYear: 2023)
let secondBook = Book(name: "Second Book", annoucementYear: 2020)
let thirdBook = Book(name: "Third Book", annoucementYear: 2024)
let fourthBook = Book(name: "Fourth Book", annoucementYear: 1990)

//let books = [firstBook, secondBook, thirdBook, fourthBook]

// When uncertain about let or var variable, make it a let

let unannoucedBook = Book(name: "Unannounced Book", annoucementYear: nil)
print(unannoucedBook)

/*:
 When we don't know a value there are the following choices
 - 0: Could imply that 0 is the value instead of new value
 - latestValue: Could imply that the value is the latest value
 - nil
    - *Error*: 'nil' is not compatible with expected argument type 'Int'
 */

// Optional Datatypes => <dt>?
// To change to Optional Datatype the variable needs to be Type Annotated, Type Inference will not work with it

// Create books as a optional array of books
var books: [Book]? = nil
books = [firstBook, secondBook, thirdBook, fourthBook]

// [Book]? => books = nil
// [Book?] => books = [nil]


//: ### Force Unwrap
// Optionals are treated as a block in the memory
var optionalInt: Int?
optionalInt = 2025

print(optionalInt) // Output - Optional(2025)

//: [Un-Wrapping using !]
//: - Usually not preferred method to resolve optionals
print(optionalInt!) // Output - 2025

//: [Un-Wrapping with Checks]
let optionalBook = Book(name: "Optional Book with Nil", annoucementYear: nil)

//print(optionalBook.annoucementYear!) // - Error
if (optionalBook.annoucementYear != nil) {
    print("Optional Value:", optionalBook.annoucementYear!)
} else {
    print("Optional Value not Defined Yet.")
}

// Issue - Repeated Checking if the value is used multiple times in the program
// Solution - Optional Binding

let newBook = Book(name: "New Book", annoucementYear: nil)

// Optional Binding => Using if-let to unwrap an optional value to convert it into a non-optional datatype
if let year = newBook.annoucementYear {
    print("Optional Value:", year)
} else {
    print("Value is Nil for Year.")
}

//: ### Functions and Optionals
/*:
- `Int(String)` => Returns Optional Int
 */

let intValue = "199"
let actualIntValue = Int(intValue)
print(actualIntValue!)

let randomStringValue = "sample"
let randomStringValueAsInt = Int(randomStringValue)
print(randomStringValueAsInt) // returns nil

//: ### Failable Initilizers

struct Toddler {
    var name: String
    var monthsOld: Int
    
    init? (name: String, monthsOld: Int) {
        if monthsOld < 12 || monthsOld > 36 {
            return nil
        } else {
            self.name = name
            self.monthsOld = monthsOld
        }
    }
}

// init?() => Return nil under specific conditions instead of a instance


