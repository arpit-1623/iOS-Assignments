
import UIKit

struct StoreCategory: Identifiable {
    let name: String
    let id = UUID()
    let color = UIColor.random
}
