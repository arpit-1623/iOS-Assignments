import UIKit

var greeting = "Hello, playground"

struct Emoji : Codable {
    var emoji: String
    var title: String
    var description: String
    
    init(emoji: String, title: String, description: String) {
        self.emoji = emoji
        self.title = title
        self.description = description
    }
}

// Directory
let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")

print("Documents: \(documentsDirectory)")
print("Archive URL: \(archiveURL)")

// Sample Emoji
let sampleEmoji = Emoji(emoji: "🤓", title: "Nerd", description: "Guy with Glasses")

// Encode Emoji
let propertyListEncoder = PropertyListEncoder()
let encodedNote = try? propertyListEncoder.encode(sampleEmoji)

// Write to File
try? encodedNote?.write(to: archiveURL, options: .noFileProtection)

// Read from File
let propertyListDecoder = PropertyListDecoder()
if let retrievedEmojiData = try? Data(contentsOf: archiveURL) {
    let decodedEmoji = try? propertyListDecoder.decode(Emoji.self, from: retrievedEmojiData)
    print(decodedEmoji ?? "No Emoji!")
}
