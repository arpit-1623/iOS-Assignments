/*:
## Exercise - For-In Loops
 
 Create a for-in loop that loops through values 1 to 100, and prints each of the values.
 */
for i in 1...100 {
    print(i)
}

//:  Create a for-in loop that loops through each of the characters in the `alphabet` string below, and prints each of the values alongside the index.
let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" 

for (idx, letter) in alphabet.enumerated() {
    print("\(letter) @ Index - \(idx)")
}
//:  Create a `[String: String]` dictionary, where the keys are names of states and the values are their capitals. Include at least three key/value pairs in your collection, then use a for-in loop to iterate over the pairs and print out the keys and values in a sentence.
var sampleStates: [String: String] = [:]
sampleStates["Punjab"] = "Chandigarh"
sampleStates["Harayana"] = "Chandigarh"
sampleStates["Jammu & Kashmir"] = "Jammu"

for (state, capital) in sampleStates {
    print("The capital of \(state) is \(capital).")
}

/*:
page 1 of 6  |  [Next: App Exercise - Movements](@next)
 */
