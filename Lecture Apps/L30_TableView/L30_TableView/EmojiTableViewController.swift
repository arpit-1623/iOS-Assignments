//
//  EmojiTableViewController.swift
//  L30_TableView
//
//  Created by Arpit Garg on 18/08/25.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    /*
        textLabel - UILabel for the title
        detailTextLabel - UILabel for the subtitle
        imageView - UIImageView for the image
     
     
        # Setting content in Cell
            var content                 = cell.defaultContentConfiguration()
            content.text                = "Title" // text label (title)
            content.secondaryText       = "Subtitle" // detail text label (subtitle)
            content.image               = UIImage(systemName: "star") // image
            cell.contentConfiguration   = content
     
        # Index Paths
            - To access a specific cell in a specific section in the table view, you can use an `IndexPath`.
            - Zero-Based Index
     
            => indexPath.row, indexPath.section
     
        # Dequeuing Reusable Cells
            - Cells are dequeued using `dequeueReusableCell(withIdentifier:for:)` method.
            - This method reuses cells that are no longer visible to the user, improving performance.
    
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
     
        # Table View Protocols
            - `UITableViewDataSource` protocol is used to provide data to the table view.
            - `UITableViewDelegate` protocol is used to handle user interactions with the table view. (optional)
     */

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // Method can be removed for one section only
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell                    = tableView.dequeueReusableCell(withIdentifier: "EmojiTableCell", for: indexPath)
        
        var content                 = cell.defaultContentConfiguration() // Modify the default configuration for the cell
        
        content.text                = "\(emotes[indexPath.row].symbol) \(emotes[indexPath.row].name)"
        content.secondaryText       = emotes[indexPath.row].description
        
        cell.contentConfiguration   = content
        
        return cell
    }
    
    // Table View Delegate Methods
    
    // Accessory Interaction
    
    
    // User Interaction
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        print("Selected Emoji: \(emotes[indexPath.row].symbol) \(emotes[indexPath.row].name)")
    }
}
