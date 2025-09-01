//
//  TaskTableViewCell.swift
//  14 - List Guided Project
//
//  Created by Arpit Garg on 01/09/25.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var isCompleteStateButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var delegate: TaskCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(with task: Task) {
        self.titleLabel.text = task.title
        self.isCompleteStateButton.isSelected = task.isComplete
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self)
    }
}
