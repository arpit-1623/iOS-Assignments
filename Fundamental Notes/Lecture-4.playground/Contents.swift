/*:
 # Lecture - 4
 ## Strings
 */

let greeting = "Hello"
var otherGreeting = "Hello"
otherGreeting = "Salutations"
print(otherGreeting)

let joke = """
Q. Question?
A. Answer.
"""

print(joke)

let characterString = "a"
let character: Character = "a"

/*:
 ### Empty Strings
 */

var myString: String = ""

if myString.isEmpty {
    print("String is Empty")
}

/*:
 ### Concatenation
 */

let string1 = "Hello"
let string2 = ", World"
var concatenatedString = string1 + string2
print(concatenatedString)

/*:
 ### Interpolation
 */

print("\(string1)\(string2)")

let a = 4
let b = 5

// Expressions in Interpolation
print("\(a) + \(b) = \(a + b)")


/*:
 ### String Equality and Comparison
 */

let month = "January"
let otherMonth = "January"
let lowerCaseMonth = "january"

print(month == otherMonth) // true
print(month == lowerCaseMonth) // false

// LOWERCASE & UPPERCASE
print(month.lowercased() == lowerCaseMonth.lowercased()) // true
print(month.uppercased() == lowerCaseMonth.uppercased()) // true

/*:
 ### Prefix and Suffix
 */

let stringSample = "Hello, World"

print(stringSample.hasPrefix("Hello")) // true
print(stringSample.hasSuffix("World")) // true
print(stringSample.hasSuffix("world")) // false


// Substrings
print(stringSample.contains(","))

// Length
let newSample = "Ryan Notch"
let count = newSample.count

print(count) // 10 - Includes Whitespaces


let newPassword = "1234"

if newPassword.count < 8 {
    print("Password Too Short!")
}

// Strings in Switch Case
let sampleCharacter: Character = "e"

switch sampleCharacter {
case "a", "e", "i", "o", "u":
    print("\(sampleCharacter) is Vowel")
default:
    print("\(sampleCharacter) is not a Vowel")
}

/*:
 Unicode
 */

let fish = "🐠"
print(fish, fish.count)


/*:
 ## Functions
 */

func triple(value: Int) {
    let result = value * 3
    print("Triple of \(value) is \(result)")
}

triple(value: 3)

func add(firstNum: Int, secondNum: Int) {
    let result = firstNum + secondNum
    print("\(firstNum) + \(secondNum) = \(result)")
}

add(firstNum: 4, secondNum: -1)

func multiply(firstNum: Int, secondNum: Int) -> Int {
    var total = firstNum * secondNum
    return total
}

print(multiply(firstNum: 5, secondNum: -1))

func labelledFunction(to person: String, and anotherPerson: String) {
    print("Hello \(person) and \(anotherPerson)")
}

labelledFunction(to: "Person 1", and: "Person 2")

func omitLabels(_ firstNum: Int, to secondNum: Int = -1) {
    print(firstNum + secondNum)
}

omitLabels(5, to: 3)
omitLabels(5)
