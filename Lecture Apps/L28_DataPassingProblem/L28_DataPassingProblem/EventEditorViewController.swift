//
//  EventEditorViewController.swift
//  L28_DataPassingProblem
//
//  Created by Arpit Garg on 12/08/25.
//

import UIKit

class EventEditorViewController: UIViewController {
    
    var delegate: EventData?
    
    var eventTitle: String?
    var eventDate: String?
    var eventLocation: String?
    var eventCount: String?
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var countField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleField.text = eventTitle
        dateField.text = eventDate
        locationField.text = eventLocation
        countField.text = eventCount
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        delegate?.passData(title: "", date: "", location: "", count: "")
        
        // dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "unwindToSummary", sender: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard
            let title = titleField.text,
            let date = dateField.text,
            let location = locationField.text,
            let count = countField.text
        else { return }
        
        delegate?.passData(title: title, date: date, location: location, count: count)
        
        // dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "unwindToSummary", sender: nil)
    }
}
