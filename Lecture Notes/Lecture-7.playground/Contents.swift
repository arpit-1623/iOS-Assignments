/*:
 # Lecture - 7
 ## Collections
 - Arrays
 - Dictionaries
 */

import Foundation

/*:
 ### Arrays
 - 0-Indexed
 - Access: [*idx*]
 */

var stringArrayWithoutType = ["Sample 1", "Sample 2", "Sample 3", "Sample 4"] // Type Inference
var stringArray: [String] = ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]

// Type Inference - Automatic Type Assignment

//: *Methods*
// Contains Check
print(stringArray.contains("Sample 3")) // true

// Number of Elements
print("Elements:", stringArray.count) // 4


// Access
print("Value @ Idx = 0:", stringArray[0])
print(stringArray)

// Update
stringArray[3] = "Updated Value"

// Print
print(stringArray)

// Append @ End
stringArray.append("Appended Value")
print(stringArray)

// Insert @ Index
stringArray.insert("Inserted Value", at: 1)
print(stringArray)

// Remove a Element
var removedElement: String

// - Remove At Index
removedElement = stringArray.remove(at: 2)
print(removedElement)
print(stringArray)

// - Remove Last
removedElement = stringArray.removeLast()
print(removedElement)
print(stringArray)

// - Remove First
removedElement = stringArray.removeFirst()
print(removedElement)
print(stringArray)

// - Remove All
stringArray.removeAll()
print(stringArray)

stringArray = ["Sample 1", "Inserted Value", "Sample 2", "Sample 3", "Updated Value", "Appended Value"]


// 2D-Arrays

let arr1 = [1, 2, 3, 4]
let arr2 = [5, 6, 7, 8]

let multiArray: [[Int]] = [arr1, arr2]
print(multiArray)

print("First Element of First Array:", multiArray[0][0])

print("\n*------------------------------*\n")

/*:
 ### Dictionary
 - Key-Value Pairs
 - Keys are Unique
 */

var scores: [String: Int] = ["Player 1": 500, "Player 2": 400, "Player 3": 800]

// 3 Methods to Create Dictionaries
// - var dict = [String: Int]()
// - var dict = Dictionary<String, Int>()
// - var dict: [String: Int] = [:]

// Access
print("Score of Player 2:", scores["Player 2"]!)

// Update Value
scores["Player 3"] = 399

let oldValue = scores.updateValue(495, forKey: "Player 2")
print(oldValue!)
print(scores)

// Remove Value
scores.removeValue(forKey: "Player 3")
print(scores)

// Getting Keys
var playerNames = Array(scores.keys)
print(playerNames)

// Getting Values
var scoreValues = Array(scores.values)
print(scoreValues)

// OPTIONALS SOLUTION
var newScores = ["Richard": 500, "Luke": 400, "Cheryl": 800]

scores["Oli"] = 399

    // This is to avoid 'nil' returned values, returned by the updateValue if there was no oldScore
if let oldValue = scores.updateValue(100, forKey: "Richard") {
    print("Richard's Old Score was \(oldValue)")
}

// OPTIONALS SOLUTION - EXAMPLE 2
newScores = ["Richard": 500, "Luke": 400, "Cheryl": 800]
newScores["Richard"] = nil

if let removedValue = scores.removeValue(forKey: "Luke") {
    print("Luke's Score was \(removedValue) before he stopped playing")
}

if let removedValue = scores.removeValue(forKey: "Richard") { // As Richard is 'nil', it doesnt print this statement
    print("Luke's Score was \(removedValue) before he stopped playing")
}


print("\n*------------------------------*\n")

//: ## Loops
/*:
 - "..." = Closed Range Operator
 - "..<" = Half Range Operator
 */

// Closed Range Operator Loop
for idx in 1...5 {
    print(idx)
}

print("-*-")

// Half Range Operator Loop
for idx in 1..<5 {
    print(idx)
}

print("-*-")

// Variable Omitted
for _ in 1...5 {
    print("Some Statement")
}

print("-*-")

// Iterating Over a Array
var names = ["Oli", "Richard", "Cheryl"]

for name in names {
    print("Hello, \(name)")
}

print("-*-")

// Iterating Over a String
var sample = "lorem ipsum"

for letter in sample {
    print(letter)
}

print("-*-")

// Enumerate String
for (idx, letter) in sample.enumerated() {
    print("Letter \(idx): \(letter)")
}

print("-*-")

// Iterating over a Dictionary
var sampleDict = ["Oli": 1, "Richard": 2, "Cheryl": 3]

for (key, value) in sampleDict {
    print("\(key): \(value)")
}

print("-*-")

// While Loop
var someValue = 4

while someValue > 0 {
    print("Some Value: ", someValue)
    someValue -= 1
}

print("-*-")

// Repeat - While (Alternate of Do-While)
// ---> Atleast executed once even if the statement is false by default
var steps = 0
// var steps = 6

repeat {
    print("Some Statement")
    steps -= 1
} while steps > 0

print("-*-")

// Control Transfer Statements (break, continue)
// - Break: Break away from the execution cycle
// - Continue: Skip the current execution cycle

// Prints -3 through 0
for counter in -3...3 {
    print (counter)
    if counter == 0 {
        break
    }
}

print("\n*------------------------------*\n")
