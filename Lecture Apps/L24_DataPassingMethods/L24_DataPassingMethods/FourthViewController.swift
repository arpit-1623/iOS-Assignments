//
//  FourthViewController.swift
//  L24_DataPassingMethods
//
//  Created by Arpit Garg on 08/08/25.
//

import UIKit

class FourthViewController: UIViewController {
    
    var dataFromThird: String
    
    init?(coder: NSCoder, dataFromThird: String) {
        self.dataFromThird = dataFromThird
        super.init(coder: coder)
        
        navigationItem.title = dataFromThird
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
 
