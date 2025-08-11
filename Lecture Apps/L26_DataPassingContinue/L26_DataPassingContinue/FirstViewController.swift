//
//  ViewController.swift
//  L26_DataPassingContinue
//
//  Created by Arpit Garg on 11/08/25.
//

import UIKit

class FirstViewController: UIViewController, DataPasser {
    
    func passData(labelData: String, sliderData: Double, fieldData: String) {
        updateUI(
            labelData: labelData,
            sliderData: sliderData,
            fieldData: fieldData
        )
    }

    @IBOutlet weak var firstTextLabel: UILabel!
    @IBOutlet weak var firstSlider: UISlider!
    @IBOutlet weak var firstTextField: UITextField!
    
    var secondTextLabelData: String?
    var secondSliderData: Double?
    var secondTextFieldData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTextLabel.text = "Hello, World!"
    }

    @IBSegueAction func firstToSecondSegue(_ coder: NSCoder) -> SecondViewController? {
        return SecondViewController(
            coder: coder,
            firstTextLabelData: firstTextLabel.text,
            firstSliderData: Double(firstSlider.value),
            firstTextFieldData: firstTextField.text
        )
    }
    
    @IBAction func unwindWithoutData(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func unwindToFirstViewController(_ segue: UIStoryboardSegue) {
        guard let secondViewController = segue.source as? SecondViewController else { return }
        
        secondTextLabelData = secondViewController.secondTextField.text
        secondSliderData    = Double(secondViewController.secondSlider.value) * 2
        secondTextFieldData = secondViewController.secondTextLabel.text
        
        guard   let labelData   = secondTextLabelData,
                let sliderData  = secondSliderData,
                let fieldData   = secondTextFieldData
        else { return }
        
        updateUI(
            labelData: labelData,
            sliderData: sliderData,
            fieldData: fieldData
        )
    }
    
    func updateUI (
        labelData: String,
        sliderData: Double,
        fieldData: String
    ) {
        firstTextLabel.text = fieldData
        firstSlider.value   = Float(sliderData) * 2
        firstTextField.text = labelData
    }
}

