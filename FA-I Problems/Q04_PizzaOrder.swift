struct Pizza {
    var toppings: [String]
    var size: Size
    var price: Double {
        switch size {
            case .small:
                return Double(200)
            case .medium:
                return Double(500)
            case .large:
                return Double(800)
        }
    }

    init?(var toppings: [String], var size: Int) {
        guard toppings.count > 0 && sizeValid(size.lowercased()) == true {
            return nil
        }

        for topping in toppings {
            topping.captialize()
        }

        self.toppings = toppings
        self.size = size
    }

    func sizeValid(size: Size) -> Bool {
        if size == .small || size == .medium ||  size == .large {
            return true
        }
        return false
    }

    func placeOrder(for pizza: Pizza?) {
        guard let pizza = pizza else {
            print("Invalid Pizza Order")
            return
        }

        let toppingList = pizza.toppingList.joined(separator: ", ")
    }
}

enum Size {
    case small, medium, large
}
