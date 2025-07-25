//
//  ResultsViewController.swift
//  08 - Guided Personality Quiz
//
//  Created by Arpit Garg on 23/07/25.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var responses: [Answer]
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    func calculatePersonalityResult() {
        let frequency = responses.reduce(into: [AnimalType: Int]()) {
            (counts, answer) in
            if let existingCount = counts[answer.type] {
                counts[answer.type] = existingCount + 1
            } else {
                counts[answer.type] = 1
            }
        }
        
        let frequentAnswerSorted = frequency.sorted(by:
                                                        { (pair1, pair2) in return pair1.value > pair2.value })
        
        let mostCommonAnswer = frequentAnswerSorted.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        
    }
    
    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) {
        
    }
}
