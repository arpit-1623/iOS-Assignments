//
//  SecondViewController.swift
//  L26_DataPassingContinue
//
//  Created by Arpit Garg on 11/08/25.
//

import UIKit

class SecondViewController: UIViewController {
    
    var delegate: DataPasser?

    @IBOutlet weak var secondTextLabel: UILabel!
    @IBOutlet weak var secondSlider: UISlider!
    @IBOutlet weak var secondTextField: UITextField!
    
    var firstTextLabelData: String?
    var firstSliderData: Double?
    var firstTextFieldData: String?
    
    init?(coder: NSCoder, firstTextLabelData: String?, firstSliderData: Double?, firstTextFieldData: String?) {
        self.firstTextLabelData     = firstTextLabelData
        self.firstSliderData        = firstSliderData
        self.firstTextFieldData     = firstTextFieldData
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard   let labelData   = firstTextLabelData,
                let sliderData  = firstSliderData,
                let fieldData   = firstTextFieldData
        else { return }
        
        updateUI(labelData: labelData, sliderData: sliderData, fieldData: fieldData)
    }
    
    func updateUI(
        labelData: String,
        sliderData: Double,
        fieldData: String
    ) {
        secondTextLabel.text        = fieldData
        secondSlider.value          = Float(sliderData) / 2
        secondTextField.text        = labelData
    }
    
    @IBAction func secondButtonTapped(_ sender: Any) {
        
        let labelData = secondTextLabel.text ?? "Default Label"
        let sliderData = Double(secondSlider.value) * 2
        let fieldData = secondTextField.text ?? "Default Field"
        
        // Pass data back to FirstViewController
        delegate?.passData(
            labelData: labelData,
            sliderData: sliderData,
            fieldData: fieldData
        )
    }
}
