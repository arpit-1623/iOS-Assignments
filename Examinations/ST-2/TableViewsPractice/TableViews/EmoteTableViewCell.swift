//
//  EmoteTableViewCell.swift
//  TableViews
//
//  Created by Arpit Garg on 05/11/25.
//

import UIKit

class EmoteTableViewCell: UITableViewCell {

    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with emote: Emote) {
        self.symbolLabel.text = emote.symbol
        self.titleLabel.text = emote.title
        self.descriptionLabel.text = emote.description
    }

}
