//
//  FormTableViewController.swift
//  L33_TableViewPractice
//
//  Created by Arpit Garg on 22/08/25.
//

import UIKit

class FormTableViewController: UITableViewController {
    
    var emoji: Emoji?
    
    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    
    init?(emoji: Emoji? = nil, coder: NSCoder) {
        self.emoji = emoji
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        checkField()
        
        updateUI(emoji: emoji)
    }
    
    func updateUI(emoji: Emoji?) {
        guard let emoji = emoji else {
            return
        }
        
        symbolTextField.text = emoji.symbol
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
        usageTextField.text = emoji.usage
    }
    
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        let emoji = Emoji(
            symbol: symbolTextField.text ?? "",
            name: nameTextField.text ?? "",
            description: descriptionTextField.text ?? "",
            usage: usageTextField.text ?? ""
        )
        
        self.emoji = emoji
        
        performSegue(withIdentifier: "unwindWithSave", sender: nil)
    }
    
    
    @IBAction func textFieldUpdate(_ sender: UITextField) {
        checkField()
    }
    
    func checkField() {
        if  symbolTextField.text != "" &&
            nameTextField.text != "" &&
            descriptionTextField.text != "" &&
            usageTextField.text != "" {
            
            navigationItem.rightBarButtonItem?.isEnabled = true
        } else {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
}
