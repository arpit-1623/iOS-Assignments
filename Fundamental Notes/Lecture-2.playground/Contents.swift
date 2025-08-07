/*:
# Lecture 2 - 1st July, 2025
 */

import UIKit


/*:
## Basic Output
 */

var greeting = "Hello, "
print(greeting)

/*:
## String Concatenation
 */
var name = "Playground";
print(greeting, name);

/*:
## Commented Content
 */
// Single-Line Comment
/*
 Multi-Line Comment
 This can have multiple lines of commented text.
 */


/*:
## Markdown
 - Enable "Render Documentation" in Inspector Pane
 - Multi-Line with Colon(:)
 */

/*:
 ## Constants and Variables
 ```
 */

let constant = "Constant Value"
//constant = "New Value"

var variableValue1 = constant;
var variableValue2 = constant;

print(variableValue1)
print(variableValue2)

variableValue1 = "New Value"

print(variableValue1)
print(variableValue2)

var num = 10;
print(num)
num += 1
print(num)

/*:
### Rules of Constants and Variables
 - No Mathematical Symbols
 - No Spaces
 - Cannot begin with a Digit
 
 #### Best Practices
 - Use Descriptive
 - Use Camel Case
 */

/*:
 ## Type Defination
 */

struct Person {
    let firstName: String
    let lastName: String
    
    func greeting() {
        print("Hello, \(firstName) \(lastName)!")
    }
}

let firstPerson = Person(firstName: "Alice", lastName: "Wonderland")
firstPerson.greeting()

let secondPerson: Person = Person(firstName: "Bob", lastName: "Dylan")
secondPerson.greeting()

// Numeric Literal Formatting
let uglyNum = 1000000000
let prettyNum = 1000_000_000

print(uglyNum)
print(prettyNum)
print(prettyNum + 1)

/*:
 ## Operators
 - *Assignment Operator (=)*
 - *Basic Arithmetic Operators (+, -, *, /)*
 - *Compound Assignment*
 - *Order of Operations*
 
 ### Numeric Type Conversion
 *Double(<Value>)*
 */
