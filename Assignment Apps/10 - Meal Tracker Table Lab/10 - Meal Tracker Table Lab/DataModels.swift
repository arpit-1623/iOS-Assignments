//
//  DataModels.swift
//  10 - Meal Tracker Table Lab
//
//  Created by Arpit Garg on 18/08/25.
//

import Foundation

struct Food {
    var name: String
    var description: String
}

struct Meal {
    var name: String
    var food: [Food]
}
