//
//  ViewController.swift
//  L10_BMI_Calculator
//
//  Created by Student on 14/07/25.
//

import UIKit

class ViewController: UIViewController {

    // Properties above viewDidLoad() [Outlets]
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var heightTextField: UITextField!
        
    @IBOutlet weak var calculateBMI: UILabel!
    
    // Profile Page Outlets
    
    override func viewDidLoad() {
        super.viewDidLoad() // Super Class viewDidLoad() Function
        // Error without () in the 13 line, Function is unused is compile time error.
        
        
    }
    
    // Methods below viewDidLoad() [Actions]
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        // bmi = weight / (height * height)
        print("Calculate BMI Button Pressed")
        
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


