//
//  ViewController.swift
//  07 - Guided Light Project
//
//  Created by Arpit Garg on 22/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    var lightOn = true
//    @IBOutlet weak var lightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        lightButton.setTitle("Off", for: .normal)
        updateUI()
    }

    fileprivate func updateUI() {
//        if lightOn == true {
//            view.backgroundColor = .white
////            lightButton.setTitle("Off", for: .normal)
//        } else {
//            view.backgroundColor = .black
////            lightButton.setTitle("On", for: .normal)
//        }
        
        view.backgroundColor = lightOn ? .white : .black
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        lightOn.toggle()
        updateUI()
    }
    
}

