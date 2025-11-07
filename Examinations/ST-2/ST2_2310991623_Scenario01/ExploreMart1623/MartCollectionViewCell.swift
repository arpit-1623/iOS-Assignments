//
//  MartCollectionViewCell.swift
//  ExploreMart1623
//
//  Created by Arpit Garg on 07/11/25.
//

import UIKit

class MartCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func update(with category: Category) {
        image.image = UIImage(systemName: category.imageName)
        nameLabel.text = category.name
    }
}
