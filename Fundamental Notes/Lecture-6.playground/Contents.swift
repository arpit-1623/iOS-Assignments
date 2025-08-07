/*:
 # Lecture 6
 ### Static in Structures
 */

struct StaticExample {
    var name: String
    nonisolated(unsafe) static var sharedVariable = 0
    
    init(_ name: String) {
        self.name = name
        incremenet()
    }
    
    func incremenet() {
        StaticExample.sharedVariable += 1
    }
    
    static func printForType() {
        print(StaticExample.sharedVariable)
    }
    
    func printForInstance() {
        print(StaticExample.sharedVariable)
    }
}


var instance1 = StaticExample("Sample Name 1")
instance1.printForInstance()
var instance2 = StaticExample("Sample Name 2")
instance1.printForInstance()
var instance3 = StaticExample("Sample Name 3")
instance1.printForInstance()
print("----------------------------------------")
StaticExample.printForType()
print("----------------------------------------")

// Fixes for error in static variable declaration
// 1. make static variable be 'let'
// 2. Decalre static variable as a main actor

/*:
 ## Classes
 */

//class ExampleStruct {
//    var name: String = ""
//    
//    init(name: String) {
//        self.name = name
//    }
//    
//    func sayHello() -> String {
//        "Hello, my name is \(name)."
//    }
//}

class ExampleClass {
    var name: String = ""
    var age: Int = 0
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sayHello() -> String {
        "Hello, my name is \(name). Age is \(age)"
    }
}

//var structInstance = ExampleStruct(name: "Struct Name")
//print(structInstance.sayHello())
//
//var structInstanceRef = structInstance


var classInstance = ExampleClass(name: "Class Name", age: 99)
print(classInstance.sayHello())

var classInstanceRef = classInstance


/*:
 ### Memory Differences
 */

print("Memory Differences:-")
//print("Struct Size:", MemoryLayout<ExampleStruct>.size, "Bytes")
print("Class Size:", MemoryLayout<ExampleClass>.size, "Bytes")
print()

/*:
 ### Pointer Differences
 - Struct is Value Type
 - Classes are Reference Type
 - Therefore, Structs maintian different memory references while classes have same memory reference for 2 copy instances
 
    A special feature of classes is their ability to reference values assigned to a constant or variable. When you create an instance of a class, Swift picks out a region in the device's memory to store that instance. That region in memory has an address. Constants or variables that are assigned the instance store that address to refer to the instance.
    So the constant or variable does not contain the value itself, it points to the value in memory.
    When you assign a class to multiple variables, each variable will reference, or point to, the same address in memory. So if you update one of the variables, both variables will be updated.
 */

print("Pointer Differences:-")

//withUnsafePointer(to: &structInstance.name) { ptr in
//    print("Memory Reference (structInstance):", ptr)
//}
//
//withUnsafePointer(to: &structInstanceRef.name) { ptr in
//    print("Memory Reference (structInstanceRef):", ptr)
//}

/*
 Size of Int Type = 8
 Size of String Type = 16
 */

//withUnsafePointer(to: &classInstance.name) { ptr in
//    print("Memory Reference (classInstance):", ptr)
//}
//
//withUnsafePointer(to: &classInstanceRef.name) { ptr in
//    print("Memory Reference (classInstanceRef):", ptr)
//}

withUnsafePointer(to: &classInstance) { ptr in
    print("Memory Reference (classInstance):", ptr)
}

withUnsafePointer(to: &classInstance.name) { ptr in
    print("Memory Reference (classInstance Name):", ptr)
}

withUnsafePointer(to: &classInstance.age) { ptr in
    print("Memory Reference (classInstance Age):", ptr)
}

/*:
 ### Inheritance
 */


class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily
        }
}

//class SomeSubclass: SomeSuperclass {
//    // subclass definition goes here
//}

class Bicycle: Vehicle {
    var hasBasket = false
}

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let someVehicle = Vehicle()
print ("Vehicle: \(someVehicle.description)")


let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 15.0
print ("Bicycle: \(bicycle.description)")

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print ("Tandem: \(tandem.description)")

// Overridding Methods and Properties

class Train: Vehicle {
    override func makeNoise() {
        print("Choo-choo!")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    var gear = 1
    override var description: String {
        super.description + " in gear \(gear)"
    }
}

let car = Car()
print(car.description)

class Person {
    let name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Student: Person {
    var favoriteSubject: String
    init(name: String, age: Int, favoriteSubject: String) {
        self.favoriteSubject = favoriteSubject
        super.init(name: name, age: age)
    }
}


var jay = Person (name: "Jay", age: 24)
var myFriend = jay
jay.age += 1
print (jay.age)
print(myFriend.age)
