//
//  AddEventViewController.swift
//  ST-Practice-EventPlanner
//
//  Created by Dr Amanpreet Singh on 01/08/25.
//

import UIKit

class AddEventViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var eventTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var premiumManagerSwitch: UISwitch!
    
    var createdEvent: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("AddEventViewController loaded")
        premiumManagerSwitch.isOn = false
    }
    
    @IBAction func createEventTapped(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty,
              let location = locationTextField.text,
              let date = dateTextField.text else { return }
        
        let typeIndex = eventTypeSegmentedControl.selectedSegmentIndex
        let eventType: EventType
        switch typeIndex {
        case 0: eventType = .Birthday
        case 1: eventType = .Meeting
        case 2: eventType = .Wedding
        default: eventType = .Meeting
        }
        
        let manager: EventManager = premiumManagerSwitch.isOn ? PremiumEventManager() : EventManager()
        
        createdEvent = Event(eventName: name, eventType: eventType, location: location, date: date, manager: manager)
        
        performSegue(withIdentifier: "showConfirmEvent", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showConfirmEvent",
           let destination = segue.destination as? ConfirmEventViewController {
            destination.event = createdEvent
        }
    }
    
    @IBAction func unwindSegue(unwind: UIStoryboardSegue) {
        nameTextField.text = ""
        dateTextField.text = ""
        locationTextField.text = ""
        premiumManagerSwitch.isOn = false
        eventTypeSegmentedControl.selectedSegmentIndex = 0
    }
}
