//: # Closures in Swift
//: Closures are self-contained blocks of functionality that can be passed around and used in your code.

//: ### What are Closures?
//: - Similar to functions but without a name
//: - Can capture and store variables from their surrounding scope
//: - Can be stored in variables, passed as parameters, and returned from functions
//: - Very useful for callbacks, sorting, and event handling

//: ### Collection Functions that Need Closures
//: - Map: Create a Collection, from another collection by application some logic
//: - Filter
//: - Reduce


import Foundation
import UIKit

//: ### Difference between Functions and Closures
//: | Functions                             | Closures                          |
//: |---------------------------------------|-----------------------------------|
//: | Have a name                           | Usually anonymous                 |
//: | Use `func` keyword                    | Defined using `{}` and `in`       |
//: | Don’t capture variables automatically | Capture values from outer scope   |
//: | Verbose syntax                        | Short, inline syntax              |


// MARK: - Example 1: Function vs Closure

// Function Syntax
func sum(_ numbers: [Int]) -> Int {
    var total = 0
    for item in numbers {
        total += item
    }
    return total
}

// Closure Syntax
let sumClosure = { (numbers: [Int]) -> Int in
    var total = 0
    for item in numbers {
        total += item
    }
    return total
}

let nums = [1, 2, 3, 6, 10]
print("Sum using Function: \(sum(nums))")
print("Sum using Closure: \(sumClosure(nums))")

//: ---


// MARK: - Example 2: Closure as Function Parameter

// Function that takes a closure
func mathematicalOperation(third: Int, additionClosure: (Int, Int) -> Int) {
    let result = additionClosure(10, 20) + third
    print("Result: \(result)")
}

// Passing closure as argument
mathematicalOperation(third: 5, additionClosure: { (first, second) -> Int in
    return first + second
})

// Trailing Closure Syntax
mathematicalOperation(third: 5) { (first, second) -> Int in
    return first + second
}

// Simplified using shorthand argument names
mathematicalOperation(third: 5) { $0 + $1 }

//: ---


// MARK: - Example 3: Sorting with Closures

struct Track: Comparable {
    var trackNumber: Int
    var trackName: String
    var trackAlbum: String
    
    static func < (lhs: Track, rhs: Track) -> Bool {
        return lhs.trackNumber < rhs.trackNumber
    }
}

let tracks = [
    Track(trackNumber: 3, trackName: "ABC", trackAlbum: "09"),
    Track(trackNumber: 7, trackName: "DEF", trackAlbum: "08"),
    Track(trackNumber: 4, trackName: "GHI", trackAlbum: "07"),
    Track(trackNumber: 1, trackName: "JKL", trackAlbum: "06"),
    Track(trackNumber: 6, trackName: "MNO", trackAlbum: "05"),
]

// Using a closure in sorted(by:)
// let sortedTracks = tracks.sorted { $0.trackNumber < $1.trackNumber }

//let sortedTracks = tracks.sorted(by: {
//    (firstTrack: Track, secondTrack: Track) -> Bool in
//    return firstTrack.trackNumber < secondTrack.trackNumber
//})

//let sortedTracks = tracks.sorted(by: {
//    (firstTrack, secondTrack) -> Bool in // Remove Datatype 'Track' as both are of same type
//    return firstTrack.trackNumber < secondTrack.trackNumber
//})

//let sortedTracks = tracks.sorted(by: {
//    (firstTrack, secondTrack) in // Remove Datatype 'Track' as both are of same type
//Remove 'Bool' because Bool is default for sorted method
//    return firstTrack.trackNumber < secondTrack.trackNumber
//})

//let sortedTracks = tracks.sorted(by: {
//    // Remove Datatype 'Track' as both are of same type
//    // Remove 'Bool' because Bool is default for sorted method
//    // Remove firstTrack and secondTrack as $0, $1 can be used to reference arguements
//    return $0.trackNumber < $1.trackNumber
//})

//let sortedTracks = tracks.sorted(by: {
//    // Remove Datatype 'Track' as both are of same type
//    // Remove 'Bool' because Bool is default for sorted method
//    // Remove firstTrack and secondTrack as $0, $1 can be used to reference arguements
//    // return can be ommitted
//    $0.trackNumber < $1.trackNumber
//})

let sortedTracks = tracks.sorted(by: <)
    // Remove Datatype 'Track' as both are of same type
    // Remove 'Bool' because Bool is default for sorted method
    // Remove firstTrack and secondTrack as $0, $1 can be used to reference arguements
    // return can be ommitted
    // Simple < can be used in some cases where the type is set to Comparable
 
print("\nSorted Track Numbers:")
for track in sortedTracks {
    print("Track \(track.trackNumber)")
}

//: ---


// MARK: - Example 4: Capturing Values

// Closure capturing outer variable
func makeIncrementer(amount: Int) -> () -> Int {
    var total = 0
    let incrementer = {
        total += amount
        return total
    }
    return incrementer
}

let incrementByTwo = makeIncrementer(amount: 2)
print("\nIncrement by Two:")
print(incrementByTwo()) // 2
print(incrementByTwo()) // 4
print(incrementByTwo()) // 6

//: The closure captures and stores the `total` variable from its surrounding scope.

//: ---


// MARK: - Closure Type Summary
//: 1️⃣ `{ () -> Void in }` → No input, no output
//: 2️⃣ `{ (params) -> Void in }` → Takes input, no output
//: 3️⃣ `{ (params) -> Datatype in }` → Takes input, returns value

let sayHello: () -> Void = {
    print("\nHello, Swift Closures!")
}

sayHello()

// Collections [MAP]
let firstNames = ["A", "B", "C", "D", "E"]

//var fullNames = firstNames.map {
//    firstName in
//    firstName + " Last"
//}

var fullNames = firstNames.map {
    $0 + " Last"
}

print(firstNames)
print(fullNames)

// Collections [FILTER]
let numbers = [4, 7, 15, 16, 23, 42]

let numbersLessThan20 = numbers.filter {
    $0 < 20
}

print(numbers)
print(numbersLessThan20)

// Collection [REDUCE]
let values = [8, 6, 7, 5, 0, 9]

let total = values.reduce(0) { current, number in
    current + number
}
print(total)

let shortcutTotal = values.reduce(0, +)
print(shortcutTotal)

//: ---
//: ### Summary
//: - Closures are lightweight, unnamed functions
//: - Capture values from surrounding context
//: - Useful for functional-style programming
//: - Support shorthand and trailing syntax for cleaner code

// UI Kit Extension
extension UIColor {
    static var random: UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

let colors = (1...10).map { _ in UIColor.random }
print(colors)
