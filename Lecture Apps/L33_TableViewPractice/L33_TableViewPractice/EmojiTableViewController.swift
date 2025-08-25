//
//  EmojiTableViewController.swift
//  L33_TableViewPractice
//
//  Created by Arpit Garg on 22/08/25.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var editingIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Editing Button
        self.navigationItem.leftBarButtonItem = editButtonItem
    }

    // Set Count of Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    // Set Count of Section Rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].emojis.count
    }
    
    // Set Section Header
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].name
    }
    
    // Populate Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        
        cell.updateUI(emoji: sections[indexPath.section].emojis[indexPath.row])
        
        return cell
    }
    
    // Editing Mode
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // Editing Mode Functionality
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete Logic
            let section = indexPath.section
            let row = indexPath.row
            
            sections[section].emojis.remove(at: row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Reordering
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let removed = sections[sourceIndexPath.section].emojis[sourceIndexPath.row]
        
        sections[destinationIndexPath.section].emojis.insert(removed, at: destinationIndexPath.row)
    }
    
    // Click on Cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        editingIndexPath = indexPath
        performSegue(withIdentifier: "editSegue", sender: indexPath)
    }
    
    // Segue Action for Data Passing
    @IBSegueAction func segueToForm(_ coder: NSCoder, sender: Any?) -> FormTableViewController? {
        guard let sender = sender as? IndexPath else {
            return FormTableViewController(emoji: nil, coder: coder)
        }
        
        return FormTableViewController(emoji: sections[sender.section].emojis[sender.row], coder: coder)
    }
    
    
    // Unwind
    @IBAction func unwindToEmojiView(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindWithSave" else { return }

        guard let source = segue.source as? FormTableViewController,
              let emoji = source.emoji else { return }
        
        if let indexPath = editingIndexPath {
            // Edit Emoji
            sections[indexPath.section].emojis[indexPath.row] = emoji
            tableView.reloadRows(at: [indexPath], with: .fade)
            editingIndexPath = nil
        } else {
            // Add Emoji to first section
            sections[0].emojis.append(emoji)
            let newIndexPath = IndexPath(row: sections[0].emojis.count - 1, section: 0)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
}
