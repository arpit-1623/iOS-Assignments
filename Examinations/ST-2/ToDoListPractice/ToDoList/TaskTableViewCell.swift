//
//  TaskTableViewCell.swift
//  ToDoList
//
//  Created by Arpit Garg on 06/11/25.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var delegate: TaskCellDelegate?
    var task: Task?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        statusButton.addTarget(self, action: #selector(statusButtonTapped), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func statusButtonTapped() {
        guard var task = task else { return }
        task.isComplete.toggle()
        self.task = task
        update(with: task)
        delegate?.didToggleStatus(for: task)
    }
    
    func update(with task: Task) {
        self.task = task
        let imageName = task.isComplete ? "circle.inset.filled" : "circle"
        statusButton.setImage(UIImage(systemName: imageName), for: .normal)
        
        titleLabel.text = task.name
        dateLabel.text = task.date.formatted()
    }

}

protocol TaskCellDelegate: AnyObject {
    func didToggleStatus(for task: Task)
}
