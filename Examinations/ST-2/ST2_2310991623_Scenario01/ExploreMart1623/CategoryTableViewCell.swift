//
//  CategoryTableViewCell.swift
//  ExploreMart1623
//
//  Created by Arpit Garg on 07/11/25.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(with item: Item) {
        categoryImage.image = UIImage(systemName: item.imageName)
        nameLabel.text = item.title
        descriptionLabel.text = item.description
        priceLabel.text = "Rs. \(item.price)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
