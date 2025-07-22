//
//  SecondViewController.swift
//  06 - Order of Events
//
//  Created by Arpit Garg on 22/07/25.
//

import UIKit

class MiddleViewController: UIViewController {

    @IBOutlet weak var lifecycleEventsLabel: UILabel!
    
    var eventNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addEvent(from: "viewDidLoad")

        // Do any additional setup after loading the view.
    }
    
    func addEvent(from: String) {
        if let existingText = lifecycleEventsLabel.text {
            lifecycleEventsLabel.text = "\(existingText)\nEvent Number \(eventNumber): \(from)"
            eventNumber += 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Second View Will Appear.")
        addEvent(from: "viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Second View Will Disappear")
        addEvent(from: "viewWillDisappear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Second View Did Appear.")
        addEvent(from: "viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Second View Did Disappear")
        addEvent(from: "viewDidDisappear")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
