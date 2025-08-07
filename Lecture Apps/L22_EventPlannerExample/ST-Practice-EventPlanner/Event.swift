//
//  Event.swift
//  ST-Practice-EventPlanner
//
//  Created by Dr Amanpreet Singh on 01/08/25.
//

enum EventType: String {
    case Birthday, Meeting, Wedding
}

class EventManager {
    func describe() -> String {
        return "managed by a normal event manager."
    }
}

class PremiumEventManager: EventManager {
    override func describe() -> String {
        return "managed by a premium event manager."
    }
}

struct Event {
    var eventName: String
    var eventType: EventType
    var location: String
    var date: String
    var manager: EventManager

    var summary: String {
        return "You're planning a \(eventType.rawValue) called \(eventName) on \(date) at \(location). This event is  \(manager.describe())"
    }
}

var allEvents: [Event] = []
