// iTunesSearch

import UIKit

class ItemCollectionViewCell: UICollectionViewCell, ItemDisplaying {
    static let placeholder = UIImage(systemName: "photo")!

    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    
}
