//
//  AddEventViewController.swift
//  L21_PracticeQuestion
//
//  Created by Arpit Garg on 04/08/25.
//

import UIKit

class AddEventViewController: UIViewController {
    @IBOutlet weak var eventNameField: UITextField!
    @IBOutlet weak var eventLocationField: UITextField!
    @IBOutlet weak var eventDateField: UITextField!
    @IBOutlet weak var premiumManagerSwitch: UISwitch!
    @IBOutlet weak var eventTypeSegment: UISegmentedControl!
    
    var currentEvent: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Confirmation" {
            let destination = segue.destination as! ConfirmEventViewController
            
            if let currentEvent = currentEvent {
                destination.confirmEvent = currentEvent
            }
        }
    }
    
    @IBAction func addEventButtonTapped(_ sender: UIButton) {
        currentEvent = Event(
            name: eventNameField.text ?? "",
            location: eventLocationField.text ?? "",
            date: eventDateField.text ?? "",
            premium: premiumManagerSwitch.isOn,
            type: getType()
        )
    }
    
    func getType() -> EventType {
        switch eventTypeSegment.selectedSegmentIndex {
        case 0:
            return .wedding
        case 1:
            return .birthday
        case 2:
            return .meeting
        default:
            return .wedding
        }
    }
}
