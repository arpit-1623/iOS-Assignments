//
//  EmojiTableViewController.swift
//  L31_TableViewRevision
//
//  Created by Arpit Garg on 21/08/25.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    /*
     
     numberOfRowsInSection  - Number of Rows in Section
     editingStyleForRowAt   - Enable Editing Button
     commit                 - Logic for Editing Button
     moveRowAt              - Enable and Logic for Reordering
     didSelectRowAt         - Click on Row
     
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Editing Mode Button
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        emotes = loadEmotes()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell                    = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        
// => For Default Configuration :-
//        var config                  = cell.defaultContentConfiguration()
//        config.text                 = "\(emotes[indexPath.row].symbol) \(emotes[indexPath.row].name)"
//        config.secondaryText        = "\(emotes[indexPath.row].description)"
//        cell.contentConfiguration  = config
        
// => For Custom Configuration
        
        cell.updateUI(emoji: emotes[indexPath.row])
        
        return cell
    }
    
    // Editing Mode
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Update the array itself
            emotes.remove(at: indexPath.row) // returns the removed element
            saveEmotes(emotes)
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
        saveEmotes(emotes)
    }
    
    // Trigger Action by Clicking on Cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addEditSegue", sender: indexPath) // Sender is important for this
        
        // You can also do it implicitly without triggering the segue by creating the segue from the cell directly.
    }
    
    @IBSegueAction func segueToForm(_ coder: NSCoder, sender: Any?) -> FormTableViewController? {
        guard let sender = sender as? IndexPath else {
            return FormTableViewController(emoji: nil, coder: coder)
        }
                
        return FormTableViewController(emoji: emotes[sender.row], coder: coder)
    }
    
    // Unwind for Cancel and Save Button
    @IBAction func unwindToEmotesScreen(segue: UIStoryboardSegue) {
        
        if segue.identifier == "unwindWithCancel" { return }
        
        if segue.identifier == "unwindWithSave" {
            guard let sourceVC = segue.source as? FormTableViewController,
                  let emoji = sourceVC.emoji
            else { return }
            
            print(emoji)
            
            
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
                // Add Emoji = Value of indexPathForSelectedRow = nil, meaning that the + button was tapped instead of a cell
                emotes.append(emoji)
                saveEmotes(emotes)
                
                let newIndexPath = IndexPath(row: emotes.count - 1, section: 0)
                
                tableView.insertRows(at: [newIndexPath], with: .fade)
                return
            }
            
            // Edit Emoji
            emotes[selectedIndexPath.row] = emoji
            saveEmotes(emotes)
            tableView.reloadRows(at: [selectedIndexPath], with: .fade)
            
            // Alternate of tableView.reloadRows(at: [selectedIndexPath], with: .fade)
            // tableView.reloadData()
            // this becomes in-efficient in case of large data sets as it reloads the entire table view.
        }
    }
    
}
