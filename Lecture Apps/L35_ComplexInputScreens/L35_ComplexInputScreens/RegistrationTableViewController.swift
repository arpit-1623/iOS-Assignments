//
//  RegistrationTableViewController.swift
//  L35_ComplexInputScreens
//
//  Created by Arpit Garg on 27/08/25.
//

import UIKit

class RegistrationTableViewController: UITableViewController {
    
    var registrations: [Registration] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registrations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)
        
        let registration = registrations[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = registration.firstName + " " + registration.lastName
        content.secondaryText = (
            registration.checkInDate..<registration.checkOutDate
        ).formatted(date: .numeric, time: .omitted) + " : " + registration.roomType.name
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    @IBAction func unwindFromAddRegistration(segue: UIStoryboardSegue) {
        guard let addRegistrationTableViewController = segue.source as? AddRegistrationTableViewController,
              let registration = addRegistrationTableViewController.registration else {
            return
        }
        
        if let editingIndexPath = addRegistrationTableViewController.editingIndexPath {
            registrations[editingIndexPath.row] = registration
        } else {
            registrations.append(registration)
        }
            
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let registration = registrations[indexPath.row]
        performSegue(withIdentifier: "editRegistration", sender: registration)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editRegistration" {
            guard let navigationController = segue.destination as? UINavigationController,
                  let addRegistrationTableViewController = navigationController.topViewController as? AddRegistrationTableViewController,
                  let registration = sender as? Registration
            else { return }
            
            addRegistrationTableViewController.editingRegistration = registration
            addRegistrationTableViewController.editingIndexPath = tableView.indexPathForSelectedRow
            
            
        }
    }
}
