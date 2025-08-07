/*:
# Lecture - 3
## Control Flow
 ### if-else Conditionals
 */

//if /*condition*/ {
//    //body
//} else if /*condition*/ {
//    //body
//} else {
//    //body
//}
 
// AND = &&
// OR = ||

/*:
 ### Switch Statement
 */

let numberOfWheels = 2

switch numberOfWheels {
case 0:
    print("No Wheels")
case 1:
    print("Unicycle")
case 2:
    print("Bicycle")
case 3:
    print("Tricycle")
case 4:
    print("Quadcycle")
default:
    print("More than 4 wheels")
}

let character = "a"

switch character {
case "a", "e", "i", "o", "u":
    print("Vowel")
default:
    print("Consonant")
}

let distance = 66

switch distance {
case 0...9:
    print("Small")
case 10...99:
    print("Medium")
case 100...999:
    print("Large")
default:
    print("Not in Range")
}

// ..<9 = 0, 1, 2, 3, 4, 5, 6, 7, 8


/*:
 *Switch Challenge*
 */

let temperature = 70

switch temperature {
case 65...75:
    print("The Temperature is Just Right.")
case Int.min..<65:
    print("It's Too Cold.")
default:
    print("It's Too Hot.")
}

/*:
 ### Ternary Operator
 *variable* = *condition* ? *true_value* : *false_value*
 */

var largest: Int
let a = 15
let b = 3

largest = a > b ? a : b

print(largest)

