//
//  ThirdViewController.swift
//  DataPassingMethods
//
//  Created by Dr Amanpreet Singh on 04/12/24.
//

import UIKit



class DelegatePrepareFirstVC: UIViewController, DelegatePrepareSecondVCDataDelegate {
    
    func didReceiveDataFromSecondVC(_ data: String) {
        navigationTitle = data
    }
   
    @IBOutlet weak var firstDataTextView: UITextField!
    var navigationTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let navigationTitle = navigationTitle {
            navigationItem.title = navigationTitle
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? DelegatePrepareSecondVC else { return }
        destinationVC.dataFromFirstVC = firstDataTextView.text
        destinationVC.delegate = self
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
