//
//  EmojiTableViewCell.swift
//  L33_TableViewPractice
//
//  Created by Arpit Garg on 22/08/25.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateUI(emoji: Emoji) {
        self.symbolLabel.text = emoji.symbol
        self.titleLabel.text = emoji.name
        self.subtitleLabel.text = emoji.description
    }

}
