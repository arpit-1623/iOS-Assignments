//
//  ViewController.swift
//  L10_BMI_Calculator
//
//  Created by Student on 14/07/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var heightTextField: UITextField!
        
    @IBOutlet weak var calculateBMI: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Error without () in the 13 line, Function is unused is compile time error.
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        // bmi = weight / (height * height)
        
        let weightString = weightTextField.text ?? ""
        let weight = Double(weightString) ?? 0
        
        let heightString = heightTextField.text ?? ""
        let height = Double(heightString) ?? 0
        
        let bmi = weight / (height * height)
        
//        let formattedBMI = String(format: "%.2f", bmi)
        
        calculateBMI.text = "Result BMI: \(bmi)"
//        calculateBMI.text = "Result BMI: \(formattedBMI)"
    }
}

