import UIKit

protocol ToDoCellDelegate {
    func checkMarkTapped(_ sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
    
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var delegate: ToDoCellDelegate?
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        delegate?.checkMarkTapped(self)
    }
}
