//
//  MoodsViewController.swift
//  L23_MoodMealApp
//
//  Created by Arpit Garg on 07/08/25.
//

import UIKit

class MoodsViewController: UIViewController {
    
    var currentMood: Mood?

    @IBOutlet weak var moodButton1: UIButton!
    @IBOutlet weak var moodButton2: UIButton!
    @IBOutlet weak var moodButton3: UIButton!
    @IBOutlet weak var moodButton4: UIButton!
    
    @IBOutlet weak var moodLabel1: UILabel!
    @IBOutlet weak var moodLabel2: UILabel!
    @IBOutlet weak var moodLabel3: UILabel!
    @IBOutlet weak var moodLabel4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        navigationItem.title = "Select Mood"
    }
    
    func updateUI() {
//        moodButton1.setTitle(Mood.Happy.emoji, for: .normal)
//        moodButton2.setTitle(Mood.Sad.emoji, for: .normal)
//        moodButton3.setTitle(Mood.Tired.emoji, for: .normal)
//        moodButton4.setTitle(Mood.Energetic.emoji, for: .normal)
        
        setButtonTitle(moodButton1, content: Mood.Happy.emoji)
        setButtonTitle(moodButton2, content: Mood.Sad.emoji)
        setButtonTitle(moodButton3, content: Mood.Tired.emoji)
        setButtonTitle(moodButton4, content: Mood.Energetic.emoji)
        
        moodLabel1.text = Mood.Happy.rawValue
        moodLabel2.text = Mood.Sad.rawValue
        moodLabel3.text = Mood.Tired.rawValue
        moodLabel4.text = Mood.Energetic.rawValue
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
    
    @IBAction func moodButtonTapped(_ sender: UIButton) {
        if sender == moodButton1 {
            currentMood = Mood.Happy
        }
        
        if sender == moodButton2 {
            currentMood = Mood.Sad
        }
        
        if sender == moodButton3 {
            currentMood = Mood.Tired
        }
        
        if sender == moodButton4 {
            currentMood = Mood.Energetic
        }
        
        performSegue(withIdentifier: "Activities", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ActivitiesViewController
        destination.selectedMood = currentMood
    }
}
