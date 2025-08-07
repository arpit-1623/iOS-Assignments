//
//  DataModels.swift
//  L21_PracticeQuestion
//
//  Created by Arpit Garg on 04/08/25.
//

import Foundation

struct Event {
    var name: String
    var location: String
    var date: String
    var premium: Bool
    var type: EventType
}

enum EventType {
    case wedding, meeting, birthday
    
    var label: String {
        switch self {
        case .wedding:
            return "Wedding"
        case .birthday:
            return "Birthday"
        case .meeting:
            return "Meeting"
        }
    }
}

var events: [Event] = []
