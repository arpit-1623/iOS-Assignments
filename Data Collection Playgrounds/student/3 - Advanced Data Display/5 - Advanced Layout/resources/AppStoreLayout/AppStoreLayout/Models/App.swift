
import UIKit

struct App: Identifiable {
    
    let promotedHeadline: String?
    
    let title: String
    let subtitle: String
    let price: Double?
    var formattedPrice: String {
        if let price = price {
            guard let localCurrencyCode = Locale.autoupdatingCurrent.currency?.identifier else {
                return String(price)
            }
            return price.formatted(.currency(code: localCurrencyCode))
        } else {
            return "GET"
        }
    }
    
    let id = UUID()
    let color = UIColor.random
}

