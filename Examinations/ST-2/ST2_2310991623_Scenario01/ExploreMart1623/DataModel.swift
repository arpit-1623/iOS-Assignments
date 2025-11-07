//
//  DataModel.swift
//  ExploreMart1623
//
//  Created by Arpit Garg on 07/11/25.
//

import Foundation

enum CategoryType {
    case topPicks, trending, newArrivals, recommended
}

struct Category {
    var id: UUID
    var name: String
    var imageName: String
    var type: CategoryType
    
    init(id: UUID, name: String, imageName: String, type: CategoryType) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.type = type
    }
}

struct Item {
    var title: String
    var imageName: String
    var description: String
    var price: Int
    var categoryId: UUID
    
    init(title: String, imageName: String, description: String, price: Int, categoryId: UUID) {
        self.title = title
        self.imageName = imageName
        self.description = description
        self.price = price
        self.categoryId = categoryId
    }
}

class DataModel {
    static let shared = DataModel(categories: [], items: [])
    
    var categories: [Category] = []
    var items: [Item] = []
    
    init(categories: [Category], items: [Item]) {
        self.categories = sampleCategories()
        self.items = sampleItems()
    }
    
    func sampleCategories() -> [Category] {
        var temp: [Category] = []
        
        // Top Picks
        for i in 1...9 {
            temp.append(Category(
                id: UUID(),
                name: "Top Pick \(i)",
                imageName: "star.fill",
                type: .topPicks
            ))
        }
        
        // Trending Deals
        for i in 1...5 {
            temp.append(Category(
                id: UUID(),
                name: "Trending \(i)",
                imageName: "chart.bar.fill",
                type: .trending
            ))
        }
        
        // New Arrivals
        for i in 1...8 {
            temp.append(Category(
                id: UUID(),
                name: "New Arrival \(i)",
                imageName: "sparkles",
                type: .newArrivals
            ))
        }
        
        // Recommended
        for i in 1...6 {
            temp.append(Category(
                id: UUID(),
                name: "Recommended \(i)",
                imageName: "hand.thumbsup.fill",
                type: .recommended
            ))
        }
        
        return temp
    }
    
    func sampleItems() -> [Item] {
        var temp: [Item] = []
        
        for category in categories {
            for i in 1...5 {
                temp.append(Item(
                    title: "\(category.name) Item \(i)",
                    imageName: category.imageName,
                    description: "High quality product from \(category.name) collection",
                    price: Int.random(in: 500...5000),
                    categoryId: category.id
                ))
            }
        }
        
        return temp
    }
    
    func getCategories(_ type: CategoryType) -> [Category] {
        return categories.filter { $0.type == type }
    }
    
    func getItems(for categoryId: UUID) -> [Item] {
        return items.filter { $0.categoryId == categoryId }
    }

}
