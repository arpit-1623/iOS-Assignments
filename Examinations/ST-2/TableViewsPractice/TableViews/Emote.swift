//
//  Emote.swift
//  TableViews
//
//  Created by Arpit Garg on 05/11/25.
//

import Foundation

struct Emote: Codable {
    var symbol: String
    var title: String
    var description: String
    
    static func sampleEmotes() -> [Emote] {
        let emotes = [
            Emote(symbol: "🤓", title: "Nerd", description: "Face with Glasses"),
            Emote(symbol: "😀", title: "Smile", description: "Face with Smile"),
            Emote(symbol: "😂", title: "Laugh", description: "Face with Laughter"),
            Emote(symbol: "😍", title: "Heart Eyes", description: "Face with Heart Eyes")
        ]
        
        return emotes
    }
}

let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentDirectory.appendingPathComponent("emote_data").appendingPathExtension("json")

func saveEmotes(_ emotes: [Emote]) {
    let jsonEncoder = JSONEncoder()
    let encodedData = try? jsonEncoder.encode(emotes)
    try? encodedData?.write(to: archiveURL)
}

func loadEmotes() -> [Emote] {
    let jsonDecoder = JSONDecoder()
    
    if let encodedData = try? Data(contentsOf: archiveURL),
       let decodedData = try? jsonDecoder.decode([Emote].self, from: encodedData) {
        return decodedData
    }
    
    return []
}
