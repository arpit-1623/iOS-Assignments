//
//  SixthViewController.swift
//  DataPassingMethods
//
//  Created by Dr Amanpreet Singh on 04/12/24.
//

import UIKit

class IBSegueActionUnwindSecondVC: UIViewController {

    @IBOutlet weak var secondDataTextView: UITextField!
    var dataFromFirstVC: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let dataFromFirstVC = dataFromFirstVC {
            navigationItem.title = dataFromFirstVC
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
