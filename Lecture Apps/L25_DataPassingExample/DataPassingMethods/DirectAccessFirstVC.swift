//
//  FourthViewController.swift
//  DataPassingMethods
//
//  Created by Dr Amanpreet Singh on 04/12/24.
//

import UIKit

class DirectAccessFirstVC: UIViewController {

    @IBOutlet weak var firstDataTextView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        let destinationVC = storyboard?.instantiateViewController(identifier: "DirectSecondVC") as! DirectAccessSecondVC
        destinationVC.navigationItem.title = firstDataTextView.text
        destinationVC.firstViewController = self
        navigationController?.pushViewController(destinationVC, animated: true)
        
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
