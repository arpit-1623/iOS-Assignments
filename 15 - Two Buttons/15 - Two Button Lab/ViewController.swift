//
//  ViewController.swift
//  15 - Two Button Lab
//
//  Created by Student on 16/07/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func setTextButtonClicked(_ sender: UIButton) {
        textLabel.text = textField.text
    }
    
    
    @IBAction func clearTextButtonClicked(_ sender: Any) {
        textField.text = ""
        textLabel.text = ""
    }
}

