//
//  ListTableViewController.swift
//  14 - List Guided Project
//
//  Created by Arpit Garg on 01/09/25.
//

import UIKit

class TasksTableViewController: UITableViewController, TaskCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        if let savedTasks = Task.loadTasks() {
            tasks = savedTasks
        } else {
            tasks = Task.loadSampleTasks()
        }
        Task.saveTasks(tasks)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        
        let task = tasks[indexPath.row]
        cell.update(with: task)
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
                Task.saveTasks(tasks)
        }
    }
    
    @IBAction func unwindToTasks(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindWithSave",
              let source = segue.source as? AddTaskTableViewController else { return }
        
        if let task = source.currentTask  {
            if let indexOfExistingTask = tasks.firstIndex(of: task) {
                tasks[indexOfExistingTask] = task
                tableView.reloadRows(at: [IndexPath(row: indexOfExistingTask, section: 0)], with: .fade)
                    Task.saveTasks(tasks)
            } else {
                let newIndexPath = IndexPath(row: tasks.count, section: 0)
                tasks.append(task)
                tableView.insertRows(at: [newIndexPath], with: .fade)
                    Task.saveTasks(tasks)
            }
        }
        
    }
    
    @IBSegueAction func editTask(_ coder: NSCoder, sender: Any?) -> AddTaskTableViewController? {
        let detailController = AddTaskTableViewController(coder: coder)
        
        guard let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else { return detailController }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        detailController?.currentTask = tasks[indexPath.row]
        
        return detailController
    }
    
    func checkmarkTapped(sender: TaskTableViewCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            var task = tasks[indexPath.row]
            task.isComplete.toggle()
            tasks[indexPath.row] = task
            tableView.reloadRows(at: [indexPath], with: .fade)
                Task.saveTasks(tasks)
        }
    }
        
}
