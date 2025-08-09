//
//  EighthViewController.swift
//  DataPassingMethods
//
//  Created by Dr Amanpreet Singh on 04/12/24.
//

import UIKit

class DirectAccessSecondVC: UIViewController {

    @IBOutlet weak var secondDataTextView: UITextField!
    
    var firstViewController: DirectAccessFirstVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        firstViewController?.navigationItem.title = secondDataTextView.text
        navigationController?.popViewController(animated: true)
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
