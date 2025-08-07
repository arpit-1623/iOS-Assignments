//
//  ConfirmEventViewController.swift
//  ST-Practice-EventPlanner
//
//  Created by Dr Amanpreet Singh on 01/08/25.
//

import UIKit

class ConfirmEventViewController: UIViewController {
    var event: Event?
    
    @IBOutlet weak var summaryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConfirmEventViewController loaded")
        
        if let event = event {
            summaryLabel.text = event.summary
        }
    }
    @IBAction func createEventButtonTapped(_ sender: UIButton) {
        if let event = event {
            allEvents.append(event)
        }
    }
}
