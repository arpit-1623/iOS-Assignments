//
//  DataModels.swift
//  L23_MoodMealApp
//
//  Created by Arpit Garg on 07/08/25.
//

import Foundation

enum Mood {
    case Happy, Sad, Tired, Energetic
    
    var emoji: String {
        switch self {
        case .Happy:
            "😊"
        case .Sad:
            "😔"
        case .Tired:
            "😴"
        case .Energetic:
            "⚡️"
        }
    }
}

enum Activity {
    case Lazy, Low, Mid, High
    
    var emoji: String {
        switch self {
        case .Lazy:
            "🪑"
        case .Low:
            "🚶"
        case .Mid:
            "🏃"
        case .High:
            "🏋️‍♀️"
        }
    }
}

struct Food {
    var title: String
    var mood: Mood
    var activity: Activity
}

var foods: [Food] = [
    Food(title: "A", mood: .Happy, activity: .Lazy),
    Food(title: "B", mood: .Happy, activity: .Low),
    Food(title: "C", mood: .Happy, activity: .Mid),
    Food(title: "D", mood: .Happy, activity: .High),
    
    Food(title: "E", mood: .Sad, activity: .Lazy),
    Food(title: "F", mood: .Sad, activity: .Low),
    Food(title: "G", mood: .Sad, activity: .Mid),
    Food(title: "H", mood: .Sad, activity: .High),

    Food(title: "I", mood: .Tired, activity: .Lazy),
    Food(title: "J", mood: .Tired, activity: .Low),
    Food(title: "K", mood: .Tired, activity: .Mid),
    Food(title: "L", mood: .Tired, activity: .High),

    Food(title: "M", mood: .Energetic, activity: .Lazy),
    Food(title: "N", mood: .Energetic, activity: .Low),
    Food(title: "O", mood: .Energetic, activity: .Mid),
    Food(title: "P", mood: .Energetic, activity: .High),
]
