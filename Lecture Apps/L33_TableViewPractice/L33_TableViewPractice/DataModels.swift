//
//  DataModels.swift
//  L33_TableViewPractice
//
//  Created by Arpit Garg on 22/08/25.
//

import Foundation

struct Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
}

struct Section {
    var name: String
    var emojis: [Emoji]
}

var sections: [Section] = [
    Section(name: "Smileys & People", emojis: [
        Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😂", name: "Face with Tears of Joy", description: "A laughing face with tears.", usage: "laughter"),
        Emoji(symbol: "😍", name: "Smiling Face with Heart-Eyes", description: "A face with heart-shaped eyes.", usage: "love"),
        Emoji(symbol: "🤔", name: "Thinking Face", description: "A face with a hand on its chin.", usage: "thinking"),
        Emoji(symbol: "😎", name: "Smiling Face with Sunglasses", description: "A cool face with sunglasses.", usage: "cool"),
        Emoji(symbol: "😭", name: "Loudly Crying Face", description: "A face with tears streaming down.", usage: "sadness"),
        Emoji(symbol: "😡", name: "Pouting Face", description: "An angry face with a frown.", usage: "anger"),
        Emoji(symbol: "🤗", name: "Hugging Face", description: "A face giving a hug.", usage: "hug"),
        Emoji(symbol: "😴", name: "Sleeping Face", description: "A face with closed eyes and a mouth.", usage: "sleep"),
        Emoji(symbol: "🤩", name: "Star-Struck", description: "A face with starry eyes.", usage: "amazement")
    ]),
    Section(name: "Animals & Nature", emojis: [
        Emoji(symbol: "🐶", name: "Dog Face", description: "A friendly dog face.", usage: "dog"),
        Emoji(symbol: "🐱", name: "Cat Face", description: "A cute cat face.", usage: "cat"),
        Emoji(symbol: "🦁", name: "Lion Face", description: "A majestic lion face.", usage: "lion"),
        Emoji(symbol: "🐸", name: "Frog Face", description: "A happy frog face.", usage: "frog"),
        Emoji(symbol: "🐵", name: "Monkey Face", description: "A playful monkey face.", usage: "monkey"),
        Emoji(symbol: "🦊", name: "Fox Face",   description: "A sly fox face.", usage: "fox"),
        Emoji(symbol: "🐼", name: "Panda Face", description: "A cute panda face.", usage: "panda"),
        Emoji(symbol: "🐨", name: "Koala Face", description: "A cuddly koala face.", usage: "koala"),
        Emoji(symbol: "🐯", name: "Tiger Face", description: "A fierce tiger face.", usage: "tiger"),
        Emoji(symbol: "🐰", name: "Rabbit Face", description: "A cute rabbit face.", usage: "rabbit")
    ]),
    Section(name: "Food & Drink", emojis: [
        Emoji(symbol: "🍏", name: "Green Apple", description: "A fresh green apple.", usage: "apple"),
        Emoji(symbol: "🍔", name: "Hamburger", description: "A tasty hamburger.", usage: "burger"),
        Emoji(symbol: "🍕", name: "Pizza", description: "A slice of pizza.", usage: "pizza"),
        Emoji(symbol: "🍣", name: "Sushi", description: "A piece of sushi.", usage: "sushi"),
        Emoji(symbol: "🍩", name: "Doughnut", description: "A sweet doughnut.", usage: "doughnut"),
        Emoji(symbol: "🍦", name: "Ice Cream", description: "A cone of ice cream.", usage: "ice cream"),
        Emoji(symbol: "🍉", name: "Watermelon", description: "A slice of watermelon.", usage: "watermelon"),
        Emoji(symbol: "🍪", name: "Cookie", description: "A chocolate chip cookie.", usage: "cookie"),
        Emoji(symbol: "🍫", name: "Chocolate Bar", description: "A bar of chocolate.", usage: "chocolate"),
        Emoji(symbol: "🍿", name: "Popcorn", description: "A bucket of popcorn.", usage: "popcorn")
    ])
]
