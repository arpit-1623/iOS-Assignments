/*:
 # Lecture - 5
 ## Structures
 A Strcucture is a custom data type - Collection of different data types
 
 - *Value Type*: Structures are Value Type in Swift (Stack)
 - *Reference Type*: Classes are Reference Type in Swift (Heap)
 */

struct Person {
    var name: String // Property of A Structure
    var age: Int
    
    func printPerson() { // Methods in Structure
        print("Person Name: \(self.name)")
        print("Person Age: \(self.age)")
    }
}

// Instance of a Structure - Allocate memory to the Data

let firstPerson = Person(name: "John", age: 20)
//print(firstPerson.name)
//print(firstPerson.age)
firstPerson.printPerson()

/*:
 When some value is assigned to the properties in the instance they are known as "Stored Propeties"
 */

/*:
 firstPerson = Structure Instance
 name, age = Structure Properties
 */

/*:
 ### Getting Memory Size of Structures
`MemoryLayout<GENERIC>.size`
 
 ### Let Keyword in Structures
 */

print("Size of the Person Structure: \(MemoryLayout<Person>.size)")


struct Shirt {
    var size: String
    var color: String
    
    func printShirt() { // Methods in Structure
        print("---------------------------")
        print("Shirt Size: \(self.size)")
        print("Shirt Color: \(self.color)")
        print("---------------------------")
    }
    
    mutating func setSize(size: String) {
        self.size = size
    }
}

var myShirt = Shirt(size: "XL", color: "Blue")
let yourShirt = Shirt(size: "M", color: "Red")

myShirt.printShirt()
yourShirt.printShirt()

//yourShirt.color = "Black" // Error due to 'let' Keyword

myShirt.color = "Black"
myShirt.printShirt()

/*:
 - If let is used on the instance, no properties can be edited
 - If let is used on specific properties of the structure, then only those properties cannot be edited after the instance is created
 */

/*:
### Getters and Setters in Structures
 - use `mutating` keyword in the getter and setter methods
 - properties of structures are immutable by default to prevent accidental changes, hence `mutating` keyword needs to be used.
 */

myShirt.setSize(size: "XXL")
myShirt.printShirt()

struct Car {
    var make: String
    var year: Int
    var color: String
    
    func startEngine() {
        print("Engine Started")
    }
    
    func drive() {
        print("Drive Mode")
    }
    
    func park() {
        print("Park Mode")
    }
    
    func steer(direction: String) {
        print("Turn to \(direction)")
    }
}

var firstCar = Car(make: "Ford", year: 2020, color: "White")
firstCar.startEngine()
firstCar.drive()
firstCar.steer(direction: "Left")
firstCar.park()

/*:
 Initializers in Structures
 */

// Method - 1: Initializers

struct IntializerStruct {
//    var string = String.init()
//    var integer = Int.init()
//    var bool = Bool.init()
    
    var string = String()
    var integer = Int()
    var bool = Bool()
}

var initializerStruct = IntializerStruct()
// IntializerStruct(string: "", integer: 0, bool: false)
print(initializerStruct)

// Method - 2: Default Values

struct DefaultValues {
    var string = "Default String"
    var integer = 99
    var bool = true
}

var defaultValues = DefaultValues()
// DefaultValues(string: "Default String", integer: 99, bool: true)
print(defaultValues)

// Method - 3: init() Method

struct IntializerMethod {
    var string: String
    var integer: Int
    var bool: Bool
    
    init() {
        self.string = "Default String"
        self.integer = 99
        self.bool = false
    }
    
    init(otherValue: Int) {
        self.integer = otherValue * 2
        self.string = ""
        self.bool = true
    }
}

var intializerMethod = IntializerMethod()
// IntializerMethod(string: "Default String", integer: 99, bool: false)
print(intializerMethod)

var intializerMethodWithValue = IntializerMethod(otherValue: 55)
// IntializerMethod(string: "", integer: 110, bool: true)
print(intializerMethodWithValue)
