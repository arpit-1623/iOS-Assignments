//
//  DataModels.swift
//  L23_MoodMealApp
//
//  Created by Arpit Garg on 07/08/25.
//

import Foundation

enum Mood: String {
    case Happy = "Happy", Sad = "Sad", Tired = "Tired", Energetic = "Energetic"
    
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

enum Activity: String {
    case Lazy = "Lazy", Low = "Low", Mid = "Mid", High = "High"
    
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
    Food(title: "🍔 Burger", mood: .Happy, activity: .Lazy),
    Food(title: "🌭 Hotdog", mood: .Happy, activity: .Low),
    Food(title: "🌮 Taco", mood: .Happy, activity: .Mid),
    Food(title: "🌯 Wrap", mood: .Happy, activity: .High),
    
    Food(title: "🍛 Curry & Rice", mood: .Sad, activity: .Lazy),
    Food(title: "🥗 Green Salad", mood: .Sad, activity: .Low),
    Food(title: "🥪 Sandwich", mood: .Sad, activity: .Mid),
    Food(title: "🍕 Pizza", mood: .Sad, activity: .High),
    
    Food(title: "🍱 Bento Box", mood: .Tired, activity: .Lazy),
    Food(title: "🍝 Pasta", mood: .Tired, activity: .Low),
    Food(title: "🍣 Sushi", mood: .Tired, activity: .Mid),
    Food(title: "🍜 Ramen", mood: .Tired, activity: .High),
    
    Food(title: "🥞 Pancakes", mood: .Energetic, activity: .Lazy),
    Food(title: "🧇 Waffles", mood: .Energetic, activity: .Low),
    Food(title: "🍪 Cookies", mood: .Energetic, activity: .Mid),
    Food(title: "🍩 Donuts", mood: .Energetic, activity: .High),
]
