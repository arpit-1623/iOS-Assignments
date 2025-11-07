//
//  TaskTableViewController.swift
//  ToDoList
//
//  Created by Arpit Garg on 06/11/25.
//

import UIKit

class TaskTableViewController: UITableViewController, TaskCellDelegate {
    
    var tasks: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Tasks"

        if (loadTasks() != nil) {
            tasks = loadTasks()!
        } else {
            tasks = Task.sampleTasks()
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        let task = tasks[indexPath.row]

//        var config = cell.defaultContentConfiguration()
//        config.text = task.name
//        config.secondaryText = task.date.formatted()
        
        cell.delegate = self
        cell.update(with: task)

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tasks.remove(at: indexPath.row)
            saveTasks(tasks: tasks)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let removed = tasks.remove(at: fromIndexPath.row)
        tasks.insert(removed, at: to.row)
        saveTasks(tasks: tasks)
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editSegue", sender: indexPath)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navController = segue.destination as? UINavigationController,
              let destination = navController.topViewController as? FormTableViewController else { return }
        
        guard (sender as? IndexPath != nil) else {
            // Add
            destination.navigationItem.title = "Add Task"
            
            return
        }
        
        // Edit
        destination.navigationItem.title = "Edit Task"
        destination.currentTask = tasks[(sender as! IndexPath).row]
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindWithSave",
              let sourceVC = segue.source as? FormTableViewController,
              let task = sourceVC.currentTask else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            // Edit existing task
            tasks[selectedIndexPath.row] = task
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        } else {
            // Add new task
            tasks.append(task)
            let newIndexPath = IndexPath(row: tasks.count - 1, section: 0)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        
        saveTasks(tasks: tasks)
    }
    
    // MARK: - TaskCellDelegate
    func didToggleStatus(for task: Task) {
        if let index = tasks.firstIndex(of: task) {
            tasks[index] = task
            saveTasks(tasks: tasks)
        }
    }

}
