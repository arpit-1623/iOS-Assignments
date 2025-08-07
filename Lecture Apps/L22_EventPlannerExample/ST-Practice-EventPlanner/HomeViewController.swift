//
//  ViewController.swift
//  ST-Practice-EventPlanner
//
//  Created by Dr Amanpreet Singh on 01/08/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var summaryTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        summaryTextView.text = "No events added yet."
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateSummary()
    }
    
    func updateSummary() {
        if allEvents.isEmpty {
            summaryTextView.text = "No events added yet."
        } else {
            var summary = "There are \(allEvents.count) events.\n\n"
            for (index, event) in allEvents.enumerated() {
                summary += "Event named \(event.eventName) is \(event.manager.describe())\n"
            }
            summaryTextView.text = summary
        }
    }
}


