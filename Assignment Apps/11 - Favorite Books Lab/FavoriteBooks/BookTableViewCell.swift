//
//  BookFormTableViewCell.swift
//  FavoriteBooks
//
//  Created by Arpit Garg on 25/08/25.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(with book: Book) {
        self.titleLabel.text = book.title
        self.authorLabel.text = "by \(book.author)"
        self.genreLabel.text = book.genre
        self.lengthLabel.text = "\(book.length) Pages"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
