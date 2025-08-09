//
//  SecondViewController.swift
//  DataPassingMethods
//
//  Created by Dr Amanpreet Singh on 04/12/24.
//

import UIKit

class IBSegueActionUnwindFirstVC: UIViewController {

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
    
    @IBAction func unwindToFirst(segue: UIStoryboardSegue) {
        guard let sourceVC = segue.source as? IBSegueActionUnwindSecondVC else { return }
        navigationTitle = sourceVC.secondDataTextView.text
    }
    

    @IBSegueAction func dataPassing(_ coder: NSCoder) -> IBSegueActionUnwindSecondVC? {
        
        let secondVC = IBSegueActionUnwindSecondVC(coder: coder)
        secondVC?.dataFromFirstVC = firstDataTextView.text
        return secondVC
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
