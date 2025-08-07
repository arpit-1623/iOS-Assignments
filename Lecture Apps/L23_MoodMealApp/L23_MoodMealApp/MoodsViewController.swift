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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        moodButton1.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        moodButton2.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        moodButton3.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        moodButton4.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    }
    
    func updateUI() {
        moodButton1.setTitle(Mood.Happy.emoji, for: .normal)
        moodButton2.setTitle(Mood.Sad.emoji, for: .normal)
        moodButton3.setTitle(Mood.Tired.emoji, for: .normal)
        moodButton4.setTitle(Mood.Energetic.emoji, for: .normal)
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
