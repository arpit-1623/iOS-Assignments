//
//  FormTableViewController.swift
//  L31_TableViewRevision
//
//  Created by Arpit Garg on 21/08/25.
//

import UIKit

class FormTableViewController: UITableViewController {
    
    var emoji: Emoji?
    
    init?(emoji: Emoji?, coder: NSCoder) {
        self.emoji = emoji
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
