//
//  ConfirmEventViewController.swift
//  L21_PracticeQuestion
//
//  Created by Arpit Garg on 04/08/25.
//

import UIKit

class ConfirmEventViewController: UIViewController {
    
    var confirmEvent: Event?

    @IBOutlet weak var confirmEventLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateEvent()
    }
    
    func updateEvent() {
        confirmEventLabel.text = """
        Event Name: \(confirmEvent?.name ?? "") \n
        Event Location: \(confirmEvent?.location ?? "") \n
        Event Date: \(confirmEvent?.date ?? "") \n
        Premium Manager: \(confirmEvent?.name ?? "") \n
        Event Type: \(confirmEvent?.type.label ?? "") \n
        """
    }
    
    @IBAction func confirmEventTapped(_ sender: UIButton) {
        if let event = confirmEvent {
            events.append(event)
        }
    }
    
}
