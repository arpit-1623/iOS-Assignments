//
//  Sample.swift
//  HomeFurniture
//
//  Created by Arpit Garg on 15/08/25.
//

import Foundation

class Furniture {
    let name: String
    let description: String
    var imageData: Data?
    
    init(name: String, description: String, imageData: Data? = nil) {
        self.name = name
        self.description = description
        self.imageData = imageData
    }
}
