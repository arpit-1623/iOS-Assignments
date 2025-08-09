import UIKit

/*
 
 You are building a Version Tracker for a software product.
 A version number consists of a major and a minor integer value, and should support:
 - Printing a user-friendly version string
 - Comparing versions to determine which one is answer
 - Sorting a collection of versions

 */

class Version: CustomStringConvertible, Comparable, Equatable {
    // When you adopt Comparable, Equatable gets automatically adopted. As, Comparable is the sub-class of Equatable.
    var major: Int
    var minor: Int
    
    init(major: Int, minor: Int) {
        self.major = major
        self.minor = minor
    }
    
    var description: String {
        return "Version: \(major).\(minor)"
    }
    
    static func < (lhs: Version, rhs: Version) -> Bool {
        if lhs.major == rhs.major {
            return lhs.minor < rhs.minor
        }
        return lhs.major < rhs.major
    }
    
    static func == (lhs: Version, rhs: Version) -> Bool {
        return lhs.minor == rhs.minor && lhs.major == rhs.major
    }
    
    // Classes need Equatable protocol conform defination because classes are reference types. For value types, == can be used for comparison. But for reference types, face ambiguity between == and ===. == is used to compare the property values and === is used to compare the memory reference of the instance.
    
    // if < & == is comformed, then the other comparisons are automatically formed. == is optional for structures. == auto-comforms != and < auto-comforms >
}

let versions = [
    Version(major: 5, minor: 3),
    Version(major: 1, minor: 2),
    Version(major: 5, minor: 7),
    Version(major: 6, minor: 3),
    Version(major: 1, minor: 0),
    Version(major: 8, minor: 2),
]

let sortedVersions = versions.sorted(by: <)
let reverseSortedVersions = versions.sorted(by: >)

print(versions)
print(sortedVersions)
print(reverseSortedVersions)

// Struct -> Class: Initializer,
