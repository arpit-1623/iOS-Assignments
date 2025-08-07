//
//  ViewController.swift
//  L21_PracticeQuestion
//
//  Created by Arpit Garg on 04/08/25.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var eventCountLabel: UILabel!
    @IBOutlet weak var eventSummaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventSummaryLabel.text = nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateUI()
    }
    
    func updateUI() {
        if events.count > 0 {
            eventCountLabel.text = "Total Events: \(events.count)"
        } else {
            eventCountLabel.text = "No Events."
            return
        }
        
        var summaryContent = ""
        
        for event in events {
            if event.premium {
                summaryContent += "Event \(event.name) is managed by a Premium Manager.\n"
            } else {
                summaryContent += "Event \(event.name) is managed by a Standard Manager.\n"
            }
            
            eventSummaryLabel.text = summaryContent
        }
    }
    
    @IBAction func unwindtoHome(segue: UIStoryboardSegue) {
        
    }


}

