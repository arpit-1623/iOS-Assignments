//
//  EmojiTableViewController.swift
//  L31_TableViewRevision
//
//  Created by Arpit Garg on 21/08/25.
//

import UIKit

class EmojiTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Editing Mode Button
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell                    = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)
        
        var config                  = cell.defaultContentConfiguration()
        
        config.text                 = "\(emotes[indexPath.row].symbol) \(emotes[indexPath.row].name)"
        config.secondaryText        = "\(emotes[indexPath.row].description)"
        
        cell.contentConfiguration  = config
        
        return cell
    }
    
    // Editing Mode
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Update the array itself
            emotes.remove(at: indexPath.row) // returns the removed element
            
            tableView.deleteRows(at: [indexPath], with: .fade) // Only removes from the table view not the array itself.
            
        } else if editingStyle == .insert {
            // Handle insertion if needed
        }
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete // you can implement logic in this function to have different editing mode for different  index paths
    }
    
    // Reordering of Table View
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let removedEmote = emotes.remove(at: sourceIndexPath.row) // Remove the item from the original position
        
        emotes.insert(removedEmote, at: destinationIndexPath.row) // Insert it at the new position
    }
    
    // Trigger Action by Clicking on Cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addEditSegue", sender: indexPath) // Sender is important for this
    }
    
    @IBSegueAction func segueToForm(_ coder: NSCoder, sender: Any?) -> FormTableViewController? {
        return <#FormTableViewController(coder: coder)#>
    }
    
}
