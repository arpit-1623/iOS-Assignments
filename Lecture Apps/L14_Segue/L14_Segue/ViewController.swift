//
//  ViewController.swift
//  L14_Segue
//
//  Created by Arpit Garg on 20/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redViewTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToRed(unwindSegue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = redViewTextField.text
    }


}

