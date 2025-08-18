//
//  MealTableViewController.swift
//  10 - Meal Tracker Table Lab
//
//  Created by Arpit Garg on 18/08/25.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    var meals: [Meal] = [
        Meal(name: "Meal 1", food: [
            Food(name: "Food 1", description: "Meal 1 Breakfast"),
            Food(name: "Food 2", description: "Meal 1 Lunch"),
            Food(name: "Food 3", description: "Meal 1 Dinner")
        ]),
        Meal(name: "Meal 2", food: [
            Food(name: "Food 4", description: "Meal 2 Breakfast"),
            Food(name: "Food 5", description: "Meal 2 Lunch"),
            Food(name: "Food 6", description: "Meal 2 Dinner")
        ]),
        Meal(name: "Meal 3", food: [
            Food(name: "Food 7", description: "Meal 3 Breakfast"),
            Food(name: "Food 8", description: "Meal 3 Lunch"),
            Food(name: "Food 9", description: "Meal 3 Dinner")
        ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
        
        content.text = food.name
        content.secondaryText = food.description

        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
}
