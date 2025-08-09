//
//  ViewController.swift
//  L24_DataPassingMethods
//
//  Created by Arpit Garg on 08/08/25.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var firstViewTextField: UITextField!
    
    // Store the values from the unwind source in a variable before using them in viewDidAppear, as the destination view controller isn't properly accessible before the viewDidAppear
    
    var titleFromSecondScreen: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SecondViewController else {
            return
        }
        
        destination.navigationItem.title = firstViewTextField.text
    }
    
    @IBAction func unwindToFirstView(_ segue: UIStoryboardSegue) {
        guard let source = segue.source as? SecondViewController else {
            return
        }
        
        titleFromSecondScreen = source.secondViewTextField.text ?? "Placeholder"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationItem.title = titleFromSecondScreen
    }


}

