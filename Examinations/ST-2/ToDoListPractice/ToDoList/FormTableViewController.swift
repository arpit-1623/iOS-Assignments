//
//  FormTableViewController.swift
//  ToDoList
//
//  Created by Arpit Garg on 06/11/25.
//

import UIKit

class FormTableViewController: UITableViewController {
    
    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var currentTask: Task?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (currentTask != nil) {
            // Edit
            update(with: currentTask!)
            
        } else {
            // Add
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func update(with task: Task) {
        let imageName = task.isComplete ? "circle.inset.filled" : "circle"
        statusButton.setImage(UIImage(systemName: imageName), for: .normal)
        
        nameField.text = task.name
        datePicker.date = task.date
    }
    
    @IBAction func statusButtonTapped(_ sender: Any) {
        let current = currentTask?.isComplete ?? false
        currentTask?.isComplete = !(current)
        update(with: currentTask!)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let name = nameField.text, !name.isEmpty else {
            // Show alert for empty name
            let alert = UIAlertController(title: "Missing Name", message: "Please enter a task name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        // Preserve existing ID if editing, otherwise create new one
        let taskId = currentTask?.id ?? UUID()
        
        currentTask = Task(
            id: taskId,
            name: name,
            date: datePicker.date,
            isComplete: currentTask?.isComplete ?? false
        )
        
        performSegue(withIdentifier: "unwindWithSave", sender: nil)
    }
    

    // MARK: - Table view data source

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
