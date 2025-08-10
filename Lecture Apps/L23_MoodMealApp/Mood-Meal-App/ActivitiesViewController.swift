//
//  ActivitiesViewController.swift
//  L23_MoodMealApp
//
//  Created by Arpit Garg on 07/08/25.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    var selectedMood: Mood?
    var selectedActivity: Activity?

    @IBOutlet weak var activityButton1: UIButton!
    @IBOutlet weak var activityButton2: UIButton!
    @IBOutlet weak var activityButton3: UIButton!
    @IBOutlet weak var activityButton4: UIButton!
    
    @IBOutlet weak var activityLabel1: UILabel!
    @IBOutlet weak var activityLabel2: UILabel!
    @IBOutlet weak var activityLabel3: UILabel!
    @IBOutlet weak var activityLabel4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        navigationItem.title = "Select Activity"
    }
    
    func updateUI() {
//        activityButton1.setTitle(Activity.Lazy.emoji, for: .normal)
//        activityButton2.setTitle(Activity.Low.emoji, for: .normal)
//        activityButton3.setTitle(Activity.Mid.emoji, for: .normal)
//        activityButton4.setTitle(Activity.High.emoji, for: .normal)
        
        setButtonTitle(activityButton1, content: Activity.Lazy.emoji)
        setButtonTitle(activityButton2, content: Activity.Low.emoji)
        setButtonTitle(activityButton3, content: Activity.Mid.emoji)
        setButtonTitle(activityButton4, content: Activity.High.emoji)
        
        activityLabel1.text = Activity.Lazy.rawValue
        activityLabel2.text = Activity.Low.rawValue
        activityLabel3.text = Activity.Mid.rawValue
        activityLabel4.text = Activity.High.rawValue
    }
    
    func setButtonTitle(_ button: UIButton, content: String) {
        button.setAttributedTitle (
            NSAttributedString (
                string: content,
                attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 100)
                ]
            ),
            for: .normal
        )
    }
    
    
    @IBAction func activityButtonTapped(_ sender: UIButton) {
        if sender == activityButton1 {
            selectedActivity = Activity.Lazy
        }
        
        if sender == activityButton2 {
            selectedActivity = Activity.Low
        }
        
        if sender == activityButton3 {
            selectedActivity = Activity.Mid
        }

        if sender == activityButton4 {
            selectedActivity = Activity.High
        }
        
        performSegue(withIdentifier: "Results", sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ResultsViewController
        destination.chosenMood = selectedMood
        destination.chosenActivity = selectedActivity
    }
}
