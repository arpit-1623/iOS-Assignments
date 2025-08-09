//
//  ThirdViewController.swift
//  L24_DataPassingMethods
//
//  Created by Arpit Garg on 08/08/25.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var thirdViewTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBSegueAction func thirdToFourthSegue(_ coder: NSCoder) -> FourthViewController? {
        return FourthViewController(coder: coder, dataFromThird: thirdViewTextField.text ?? "Placeholder")
    }
}
