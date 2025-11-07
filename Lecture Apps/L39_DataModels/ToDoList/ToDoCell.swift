//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Student on 8/2/2023.
//

import UIKit

// Protocol to define a delegate for ToDoCell interactions
protocol ToDoCellDelegate: AnyObject {
    func checkmarkTapped(sender: ToDoCell) // Delegate method for checkmark button tap
}

// Custom UITableViewCell class for ToDo items
class ToDoCell: UITableViewCell {
    
    @IBOutlet var isCompleteButton: UIButton! // Checkmark button outlet
    @IBOutlet var titleLabel: UILabel! // Label to display the title
    
    weak var delegate: ToDoCellDelegate? // Delegate to handle interactions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code to set up the cell
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self) // Notify the delegate about checkmark button tap
    }
    
}
