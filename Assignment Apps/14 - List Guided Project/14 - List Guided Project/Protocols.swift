//
//  Protocols.swift
//  14 - List Guided Project
//
//  Created by Arpit Garg on 01/09/25.
//

import Foundation

protocol TaskCellDelegate: AnyObject {
    func checkmarkTapped(sender: TaskTableViewCell)
}
