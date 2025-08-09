import UIKit

// Example 1

protocol Developer {
    func writeCode()
    func completeProject()
    func provideTestcases()
}

class JavaDeveloper : Developer {
    // Adopts and Comforms Developer Protocol
    
    func writeCode() {
        print("Written Java Code.")
    }
    
    func completeProject() {
        print("Completed Java Project.")
    }
    
    func provideTestcases() {
        print("Provided Java Testcases.")
    }
}

class SwiftDeveloper : Developer {
    // Adopts and Comforms Developer Protocol
    
    func writeCode() {
        print("Written Swift Code.")
    }
    
    func completeProject() {
        print("Completed Swift Project.")
    }
    
    func provideTestcases() {
        print("Provided Swift Testcases.")
    }
}

class Manager {
    
    var delegate: Developer?
    
    func manageTeam() {
        
    }
    
    func goForVacations() {
        
    }
}

var sampleManager = Manager()
var sampleJavaDeveloper = JavaDeveloper()
var sampleSwiftDeveloper = SwiftDeveloper()

sampleManager.delegate = sampleJavaDeveloper

sampleManager.delegate?.writeCode()
sampleManager.delegate?.completeProject()
sampleManager.delegate?.provideTestcases()

sampleManager.delegate = sampleSwiftDeveloper

sampleManager.delegate?.writeCode()
sampleManager.delegate?.completeProject()
sampleManager.delegate?.provideTestcases()


print("*----------*")
// Example 2 : Coffee Machine & Payment Delegate

protocol Payment {
    func performTransaction()
}

class UPI: Payment {
    func performTransaction() {
        print("Transaction Completed via UPI.")
    }
}

class Card: Payment {
    func performTransaction() {
        print("Transaction Completed via Card .")
    }
}

class CoffeeMachine {
    var delegate: Payment?
}

var coffeeMachine = CoffeeMachine()

coffeeMachine.delegate = UPI()
coffeeMachine.delegate?.performTransaction()

coffeeMachine.delegate = Card()
coffeeMachine.delegate?.performTransaction()
