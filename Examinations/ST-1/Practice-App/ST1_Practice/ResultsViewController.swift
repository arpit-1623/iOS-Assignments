//
//  ResultsViewController.swift
//  ST1_Practice
//
//  Created by Arpit Garg on 02/08/25.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultsTextLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonality()
    }
    
    func calculatePersonality() {
        var types: [Animal: Int] = [:]
        
        for answer in answersChosen {
            if (types[answer.type] != nil) {
                types[answer.type] = types[answer.type]! + 1
            } else {
                types[answer.type] = 1
            }
        }
        
        print(types)
        
        let sorted = types.sorted(by: {
            (type1, type2) in return type1.value > type2.value
        })
        
        let mostFrequent = sorted.first?.key
        
        switch mostFrequent {
        case .Cat:
            resultsTextLabel.text = "You Are a 🐱!"
            descriptionTextLabel.text = "IDK you are a cat."

        case .Lion:
            resultsTextLabel.text = "You Are a 🦁!"
            descriptionTextLabel.text = "IDK you are a lion."

        case .Rabbit:
            resultsTextLabel.text = "You Are a 🐰!"
            descriptionTextLabel.text = "IDK you are a rabbit."

        case .Turtle:
            resultsTextLabel.text = "You Are a 🐢!"
            descriptionTextLabel.text = "IDK you are a turtle."
            
        default:
            break
        }
        
        
    }
}
