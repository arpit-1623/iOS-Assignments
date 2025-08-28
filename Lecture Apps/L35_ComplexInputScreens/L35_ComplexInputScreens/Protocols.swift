//
//  Protocols.swift
//  L35_ComplexInputScreens
//
//  Created by Arpit Garg on 27/08/25.
//

import Foundation

protocol SelectRoomTypeTableViewControllerDelegate {
    func selectRoomTypeTableViewController(
        _ controller: SelectRoomTypeTableViewController,
        didSelect roomType: RoomType
    )
}
