//
//  EmotesTableViewController.swift
//  TableViews
//
//  Created by Arpit Garg on 05/11/25.
//

import UIKit

class EmotesTableViewController: UITableViewController {
    
    var emotes: [Emote] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        emotes = loadEmotes()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emotes.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmoteCell", for: indexPath) as! EmoteTableViewCell
        
        let emote = emotes[indexPath.row]
        
        cell.update(with: emote)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editSegue", sender: indexPath)
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            emotes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveEmotes(emotes)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let removedEmote = emotes.remove(at: fromIndexPath.row)
        emotes.insert(removedEmote, at: to.row)
        saveEmotes(emotes)

    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
     
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let navController = segue.destination as? UINavigationController,
              let destination = navController.topViewController as? EditTableViewController else { return }
        
        if segue.identifier == "editSegue",
           let selectedIndexPath = sender as? IndexPath {
            // Edit Emote
            destination.navigationItem.title = "Edit Emote"
            destination.selectedEmote = emotes[selectedIndexPath.row]
            
        } else if segue.identifier == "addSegue" {
            // Add Emote
            destination.navigationItem.title = "Add Emote"
        }
        
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        
        if (segue.identifier == "unwindWithCancel") { return }
        
        if (segue.identifier == "unwindWithSave") {
            guard let source = segue.source as? EditTableViewController,
                  let emote = source.selectedEmote else { return }
            
            print(emote)
            
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
                // Add Emoji
                let newIndexPath = IndexPath(row: emotes.count - 1, section: 0)
                
                emotes.append(emote)
                saveEmotes(emotes)
                tableView.insertRows(at: [newIndexPath], with: .fade)
                return
            }
            
            // Edit Emoji
            emotes[selectedIndexPath.row] = emote
            saveEmotes(emotes)
            tableView.reloadRows(at: [selectedIndexPath], with: .fade)
        }
        
    }

}
