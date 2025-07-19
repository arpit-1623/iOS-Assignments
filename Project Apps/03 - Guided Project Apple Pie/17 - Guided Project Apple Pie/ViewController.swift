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
    
    var totalWinds: Int = 0
    var totalLosses: Int = 0
    
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
    }
    
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }
    
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWinds), Losses: \(totalLosses)"
        treeImageView = UIImageView(image: UI xImage(named: "Tree \(currentGame.incorrectMovesRemaining)"))
    }
}

