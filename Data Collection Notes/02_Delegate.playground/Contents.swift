import UIKit
import Foundation

/*
 When one object gives a task to another object and expects it to follow some rules (which are defined in a protocol)
 */

protocol DoChores { // Custom Protocol
    func doChores()
}

class Parent {
    var delegate: DoChores?
    
    init(delegate: DoChores? = nil) {
        self.delegate = delegate
    }
}

class Child: DoChores {
    func doChores() {
        print("Doing Chores...")
    }
}

class Maid: DoChores {
    func doChores() {
        print("Maid Doing Chores...")
    }
}

var sampleChild = Child()
var sampleParent = Parent(delegate: sampleChild)

sampleParent.delegate?.doChores()

var sampleMaid = Maid()
var sampleParentWithMaid = Parent(delegate: sampleMaid)

sampleParentWithMaid.delegate?.doChores()
