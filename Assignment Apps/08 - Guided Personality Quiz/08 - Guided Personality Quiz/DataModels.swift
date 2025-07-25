//
//  Question.swift
//  08 - Guided Personality Quiz
//
//  Created by Arpit Garg on 25/07/25.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case lion = "🦁", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
    var definition:  String {
        switch self {
        case .lion:
            return "You are confident and charismatic, a natural leader who inspires others. You love being with your group and enjoy a little adventure."
            
        case .cat:
            return "You are thoughtful, curious, and enjoy solitude. You appreciate quiet time and deep thinking."
            
        case .rabbit:
            return "You are energetic, optimistic, and enjoy being around people. You love to explore and make new friends."
            
        case .turtle:
            return "You are patient, reliable, and enjoy taking things slowly. You appreciate the finer things in life and take your time to enjoy them."
        }
    }
}

var questions: [Question] = [
    Question(
        text: "Which food do you like the most?",
        type: .single,
        answers: [
            Answer(text: "Steak", type: .lion),
            Answer(text: "Fish", type: .cat),
            Answer(text: "Carrots", type: .rabbit),
            Answer(text: "Leafy greens", type: .turtle),
        ]
    ),
    Question(
        text: "What do you prefer doing in your free time?",
        type: .multiple,
        answers: [
            Answer(text: "Hiking", type: .rabbit),
            Answer(text: "Reading", type: .turtle),
            Answer(text: "Cooking", type: .lion),
            Answer(text: "Watching movies", type: .cat),
        ]
    ),
    Question(
        text: "How do you usually feel when you're tired?",
        type: .ranged,
        answers: [
            Answer(text: "I feel very energetic", type: .rabbit),
            Answer(text: "I feel a little tired", type: .turtle),
            Answer(text: "I feel very sleepy", type: .cat),
            Answer(text: "I feel very sleepy all the time", type: .lion)
        ]
    ),
]
