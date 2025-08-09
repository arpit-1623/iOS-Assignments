//
//  SeventhViewController.swift
//  DataPassingMethods
//
//  Created by Dr Amanpreet Singh on 04/12/24.
//

import UIKit

protocol DelegatePrepareSecondVCDataDelegate: AnyObject {
    func didReceiveDataFromSecondVC(_ data: String)
}

class DelegatePrepareSecondVC: UIViewController {

    @IBOutlet weak var secondDataTextView: UITextField!
    var dataFromFirstVC: String?
    var delegate: DelegatePrepareSecondVCDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let dataFromFirstVC = dataFromFirstVC {
            navigationItem.title = dataFromFirstVC
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        if let delegate = delegate, let textViewData = secondDataTextView.text {
            delegate.didReceiveDataFromSecondVC(textViewData)
            navigationController?.popViewController(animated: true)
        }
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
