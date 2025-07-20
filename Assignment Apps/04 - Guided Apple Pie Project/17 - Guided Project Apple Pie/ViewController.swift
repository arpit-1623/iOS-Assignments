//
//  ViewController.swift
//  17 - Guided Project Apple Pie
//
//  Created by Arpit Garg on 18/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords: [String] = [
        "bucaneer",
        "swift",
        "glorious",
        "incandescent",
        "bug",
        "program"
    ]
    
    let incorrectMovesAllowed: Int = 7
    
    var totalWins: Int = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses: Int = 0 {
        didSet {
            newRound()
        }
    }
    
    var currentGame: Game!
    
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var treeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newRound()
    }
    
    @IBAction func letterButtonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration?.title ?? ""
        let letter = Character(letterString.lowercased())
        
        currentGame.playerGuessed(letter)
//        updateUI()
        updateGameState()
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.formattedWord == currentGame.word {
            totalWinds += 1
        } else {
            updateUI()
        }
    }
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(true)
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        
        let wordWithSpacing = letters.joined(separator: " ")
        
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWinds), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
}
