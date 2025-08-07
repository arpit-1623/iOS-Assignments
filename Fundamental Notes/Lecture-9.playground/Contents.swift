/*:
 # Lecture - 9
 ## Assignment
 
 Design a Student and Mentor class for an online course platform.
 - Each student may or may not have a mentor assigned.
 - Every mentor can optionally have a specialization.
 - A student can attempt to fetch the mentor's specialization.
 - Only students with non-empty names and valid ages (>=10) should be allowed.
 - The method getMentorSpecialization() should return the specialization if it exists.
 - Use optional binding to safely unwrap optional values
 - Use optional chaining to get the mentor specialization it is exists
 */

class Student {
    var name: String
    var age: Int
    var mentor: Mentor?
    
    init?(name: String, age: Int, mentor: Mentor?) {
        if !name.isEmpty && age >= 10 {
            self.name = name
            self.age = age
            self.mentor = mentor
        } else {
            return nil
        }
    }
    
    func getMentorSpecialization() -> String? {
        // return mentor?.specialization
        mentor?.specialization // If there only one statement in a function it gets auto-returned.
    }
}

class Mentor {
    var name: String
    var specialization: String? = nil
    
    init(name: String, specialization: String?) {
        self.name = name
        if let specializationUnwrap = specialization {
            self.specialization = specializationUnwrap
        } else {
            self.specialization = nil
        }
    }
}

var student1 = Student(name: "", age: 9, mentor: nil)
var student2 = Student(name: "Some Student 1", age: 18, mentor: Mentor(name: "Some Mentor 1", specialization: "Some Specialization 1"))
var student3 = Student(name: "Some Student 2", age: 18, mentor: Mentor(name: "Some Mentor 2", specialization: nil))

// unwrap optional values
//
//if let student = student1 {
//    if let mentorUnwrap = student.mentor {
//        if let specializationUnwrap = mentorUnwrap.specialization {
//            print("Student \(student.name) has a mentor named \(mentorUnwrap.name) who specializes in \(specializationUnwrap)")
//        } else {
//            print("Student \(student.name) has a mentor named \(mentorUnwrap.name)")
//        }
//    } else {
//        print("Student \(student.name) does not have a mentor")
//    }
//} else {
//    print("Student is not valid.")
//}
//
//if let student = student2 {
//    if let mentorUnwrap = student.mentor {
//        if let specializationUnwrap = mentorUnwrap.specialization {
//            print("Student \(student.name) has a mentor named \(mentorUnwrap.name) who specializes in \(specializationUnwrap)")
//        } else {
//            print("Student \(student.name) has a mentor named \(mentorUnwrap.name)")
//        }
//    } else {
//        print("Student \(student.name) does not have a mentor")
//    }
//} else {
//    print("Student is not valid.")
//}

if let student = student1 {
    if let spec = student.getMentorSpecialization() {
        print("Student \(student.name) has a mentor with specialization in \(spec)")
    } else {
        print("Student \(student.name) has not mentor with specialization")
    }
} else {
    print("Student is not valid.")
}

if let student = student2 {
    if let spec = student.getMentorSpecialization() {
        print("Student \(student.name) has a mentor with specialization in \(spec)")
    } else {
        print("Student \(student.name) has not mentor with specialization")
    }
} else {
    print("Student is not valid.")
}


// optional binding to get specialization
if let spec = student2?.mentor?.specialization {
    print("Mentor of Student 2:", spec)
} else {
    print("No Specialization Avaliable.")
}

if let spec = student3?.mentor?.specialization {
    print("Mentor of Student 2:", spec)
} else {
    print("No Specialization Avaliable.")
}

// Way with default logic for nil values
// Better than using force unwrap
print(student1?.mentor?.specialization ?? "Mentor Not Found.")
print(student2?.mentor?.specialization ?? "Mentor Not Found.")

//: ## Guard
/*:
 - *GUARD* keyword is used to implement "Early Exit" in swift
 - IMPORTANT: Unwrapped value is accessible even outside of the guard let instance, while if let limits the scope.
 */
/*:
 `guard condition else {`
    *Execute false statement*
 `}`
 
 *Execute true statement*
 */

func singHappyBirthday() {
    guard birthdayIsToday else {
        print("No one has a birthday today.")
        return
    }
    
    guard !invitedGuests.isEmpty else {
        print("It's just a family party.")
        return
    }
    
    guard cakeCandlesLit else {
        print("The cake's candles haven't been lit.")
        return
    }
    
    print("Happy birthday to you!")
}

let birthdayIsToday = true
let invitedGuests: [String] = ["Alice", "Bob"]
let cakeCandlesLit = true

singHappyBirthday()

// Guard with Optionals

//var someValue: Int? = 3
//
//if let someValueUnwrap = someValue {
//    print("Some value is \(someValue)")
//} else {
//    print("Some value is nil")
//}
//
//guard let someValueUnwrap = someValue else {
//    print("Nil")
//    return
//}
//
//print("Some Value:", someValue)


//: ## Constant and Variable Scope

// Shadowing -> Lower scoped variables take preference over the higher scoped ones
// Use of Shadowing: (Better Unwrapping)

let some: Int? = nil

//if let some = some { // Both are valid
if let some {
    print("Some Value", some)
} else {
    print("Nil Value")
}

//: ## Enumerations
// grouping similar things into a type

enum CompassPoint {
    case north
    case east
    case south
    case west
}

enum CompassPoint2 {
    case north, east, south, west
}

var compassHeading = CompassPoint.west

var compassHeadingWithAnnotation: CompassPoint
compassHeadingWithAnnotation = .north
compassHeadingWithAnnotation = .east
compassHeadingWithAnnotation = .south
compassHeadingWithAnnotation = .west


// Default case in switch can be negated when using enums
switch compassHeading {
case .north:
    print("Heading North")
case .east:
    print("Heading East")
case .south:
    print("Heading South")
case .west:
    print("Heading West")
}

//: ## Assignment 2
/*:
 You are building a login system.
 - A user has a username and an optional email.
 - The system shoud check the following
    - Check that a user has a valid username and email using a function
    - Use guard and guard let to exit early if the validation fails
    - Use an enum called LoginStatus to represent possible outcomes
    - Use variable shadowing when unwrapping optionals
 */
enum LoginStatus {
    case success, invalidUsername, invalidEmail
}

struct User {
    var username: String?
    var email: String?
    
    func validUserInput() -> LoginStatus {
//        guard ((username?.isEmpty) == nil) else {
//            return .invalidUsername
//        }
//        
//        guard ((email?.contains("@")) != nil) else {
//            return .invalidEmail
//        }
        
        guard let username = username, !username.isEmpty else {
            return .invalidUsername
        }
        
        guard let email = email, email.contains("@") else {
            return .invalidEmail
        }
        
        return .success
    }
}

var user1 = User(username: "", email: "")
print(user1.validUserInput())

switch user1.validUserInput() {
case .success:
    print("Login Successful!")
case .invalidUsername:
    print("Invalid Username!")
case .invalidEmail:
    print("Invalid Email!")
}

//: ## Type Casting and Inspection

class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Dog: Animal {
    func bark() {
        print("Woof. Woof.")
    }
}

class Cat: Animal {
    func meow() {
        print("Meow. Meow.")
    }
}

class Bird: Animal {
    func chirp() {
        print("Tweek. Tweek.")
    }
}

let dog = Dog(name: "Tommy")
let cat = Cat(name: "Kitty")
let bird = Bird(name: "Sparrow")

func getClientPet(pets: [Animal]) -> Animal {
    // returns the pet
    return pets[2]
}

var allPets: [Animal] = [dog, cat, bird]
print(allPets)
// [__lldb_expr_1756.Dog, __lldb_expr_1756.Cat, __lldb_expr_1756.Bird]

let pet = getClientPet(pets: allPets) // pet is of the `Animal`
print(pet)

// `is` operator to check the type
// `is` = Type Inspection Keyword

if pet is Dog {
    print("The Pet is a Dog")
} else if pet is Cat {
    print("The Pet is a Cat")
} else if pet is Bird {
    print("The Pet is a Bird")
} else {
    print("The Pet is an Exotic Animal")
}

// This allows us to inspect and check of what type the instance is, but this doesnt convert the type of that instance

// To change the type of an instance `as`

// as? => Safely cast pet to bird if possible
// as! => Forcefully cast, only use if you are sure of the type conversion

// as? => Gives a optional datatype
// as! => Forcefully give direct datatype

let convertedDog = allPets[0] as! Dog //  dt => Dog
let convertedCat = allPets[1] as? Cat // dt => Cat?
let convertedBird = allPets[2] as? Bird


//: ## Any Generic

let anyTypeVariable: Any
let anyTypeArray: [Any] = [1, 1.2, "String", dog, cat, bird, true]

for item in anyTypeArray {
    if item is Int {
        print("Integer")
    } else if item is Double {
        print("Double")
    } else if item is String {
        print("String")
    } else if item is Dog {
        print("Dog")
    } else if item is Cat {
        print("Cat")
    } else if item is Bool {
        print("Boolean")
    } else {
        print("Other Datatypes")
    }
}
