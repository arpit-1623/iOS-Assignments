//
//  ResultsViewController.swift
//  L23_MoodMealApp
//
//  Created by Arpit Garg on 07/08/25.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var chosenMood: Mood?
    var chosenActivity: Activity?
    
    @IBOutlet weak var foodLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recommendFood()
        
        navigationItem.title = "Recommended Food"
    }
    
    func recommendFood() {
        for food in foods {
            if food.mood == chosenMood && food.activity == chosenActivity {
                foodLabel.text = food.title
            }
        }
    }
}
