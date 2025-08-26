//
//  EmojiTableViewCell.swift
//  L32_TableViewCombined
//
//  Created by Arpit Garg on 22/08/25.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        updateUI(emoji: Emoji)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateUI(emoji: Emoji) {
        emojiLabel.text = emoji.symbol
        titleLabel.text = emoji.name
        subtitleLabel.text = emoji.description
    }

}
