//
//  FormTableViewController.swift
//  L31_TableViewRevision
//
//  Created by Arpit Garg on 21/08/25.
//

import UIKit

class FormTableViewController: UITableViewController {
    
    var emoji: Emoji?
    
    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    init?(emoji: Emoji?, coder: NSCoder) {
        self.emoji = emoji
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        

    override func viewDidLoad() {
        super.viewDidLoad()
        checkFieldState() // Check Field

        updateUI(emoji: emoji);
    }

// ==> This needs to be commented out as the rows and sections have been statically defined.
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
    
    func updateUI(emoji: Emoji?) {
        guard let emoji = emoji else { return }
        
        symbolTextField.text        = emoji.symbol
        nameTextField.text          = emoji.name
        descriptionTextField.text   = emoji.description
        usageTextField.text         = emoji.usage
    }
    
    // Save
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let modifiedEmoji = Emoji(
            symbol: symbolTextField.text ?? "",
            name: nameTextField.text ?? "",
            description: descriptionTextField.text ?? "",
            usage: usageTextField.text ?? ""
        )
        
        emoji = modifiedEmoji
        
        performSegue(withIdentifier: "unwindWithSave", sender: nil)
    }
    
    // To Check if the Text Field have values
    @IBAction func updateTextField(_ sender: UITextField) {
        checkFieldState()
    }
    
    func checkFieldState() {
        if      symbolTextField.text        != "" &&
                nameTextField.text          != "" &&
                descriptionTextField.text   != "" &&
                usageTextField.text         != "" {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}
