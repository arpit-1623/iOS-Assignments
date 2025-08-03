//
//  Data.swift
//  ST1_Practice
//
//  Created by Arpit Garg on 02/08/25.
//

import Foundation

struct Question {
    var content: String
    var answers: [Answer]
    var type: QuestionType
}

enum QuestionType {
    case single, multiple, ranged
}

enum Animal {
    case Lion, Cat, Rabbit, Turtle
}

struct Answer {
    var content: String
    var type: Animal
}

var questions = [
    Question(
        content: "What is Your Name?",
        answers: [
            Answer(
                content: "Lion", type: .Lion
            ),
            Answer(
                content: "Cat", type: .Cat
            ),
            Answer(
                content: "Rabbit", type: .Rabbit
            ),
            Answer(
                content: "Turtle", type: .Turtle
            )
        ],
        type: .single
    ),
    Question(
        content: "Select Multiple",
        answers: [
            Answer(
                content: "Lion", type: .Lion
            ),
            Answer(
                content: "Cat", type: .Cat
            ),
            Answer(
                content: "Rabbit", type: .Rabbit
            ),
            Answer(
                content: "Turtle", type: .Turtle
            )
        ],
        type: .multiple
    ),
    Question(
        content: "Select Range",
        answers: [
            Answer(
                content: "Lion", type: .Lion
            ),
            Answer(
                content: "Cat", type: .Cat
            ),
            Answer(
                content: "Rabbit", type: .Rabbit
            ),
            Answer(
                content: "Turtle", type: .Turtle
            )
        ],
        type: .ranged
    )
]
