//
//  ViewController.swift
//  L28_DataPassingProblem
//
//  Created by Arpit Garg on 12/08/25.
//

import UIKit

class EventSummaryViewController: UIViewController, EventData {
    
    func passData(title: String, date: String, location: String, count: String) {
        updateUI(title: title, date: date, location: location, count: count)
    }

    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var eventCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateUI (
        title: String,
        date: String,
        location: String,
        count: String
    ) {
        eventTitleLabel.text = title
        eventDateLabel.text = date
        eventLocationLabel.text = location
        eventCountLabel.text = count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
        let navigationController = segue.destination as? UINavigationController,
        let editorViewController = navigationController.topViewController as? EventEditorViewController
        else { return }
        
        editorViewController.eventTitle = eventTitleLabel.text
        editorViewController.eventDate = eventDateLabel.text
        editorViewController.eventLocation = eventLocationLabel.text
        editorViewController.eventCount = eventCountLabel.text
        
        editorViewController.delegate = self
    }
    
    @IBAction func unwindToEventSummaryViewController(_ segue: UIStoryboardSegue) {
    }
    
    // if you want to do with segue action, make the segue action from the navgiation to screen segue not the screen to navigation segue
}

