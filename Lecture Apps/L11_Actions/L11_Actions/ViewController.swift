//
//  ViewController.swift
//  L11_Actions
//
//  Created by Student on 15/07/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var wifiToggleOutlet: UISwitch!
    @IBOutlet weak var nameFieldOutlet: UITextField!
    @IBOutlet weak var volumeSliderOutlet: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func wifiToggle(_ sender: UISwitch) {
        if sender.isOn {
            print("Wi-Fi is ON")
        } else {
            print("Wi-Fi is OFF")
        }
    }
    
    
    @IBAction func volumeControl(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBAction func nameFieldChanged(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
    @IBAction func nameReturnKeyPressed(_ sender: UITextField) {
//        print("Name \(sender.text) Submitted!")
        
        if let nameValue = sender.text {
            print("Name \(nameValue) Submitted!")
        }
    }
    
    @IBAction func displayAllValues(_ sender: UIButton) {
        print("Wi-Fi Toggle Value: \(wifiToggleOutlet.isOn) ")
        print("Volume Value: \(volumeSliderOutlet.value)")
        print("Name Field Value: \(nameFieldOutlet.text ?? "")")
    }
}

