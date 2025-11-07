//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Student on 16/9/2025.
//

import UIKit

class ToDoTableViewController: UITableViewController, ToDoCellDelegate {

    var toDos = [ToDo]() // Array to store ToDo items

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load saved ToDos or sample data
        let loadedToDos = TodoDataModel.shared.getAllTodos()
        if loadedToDos.isEmpty {
            toDos = TodoDataModel.shared.loadSampleToDos()
        } else {
            toDos = loadedToDos
        }

        navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table View Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier", for: indexPath) as! ToDoCell
        
        let toDo = toDos[indexPath.row]
        cell.delegate = self
        cell.titleLabel?.text = toDo.title
        cell.isCompleteButton.isSelected = toDo.isComplete
        
        return cell
    }

    // MARK: - Edit / Delete Rows

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            TodoDataModel.shared.deleteTodo(at: indexPath.row)
            toDos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    // MARK: - Unwind Segue

    @IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! ToDoDetailTableViewController
        
        if let toDo = sourceViewController.toDo {
            if let index = toDos.firstIndex(of: toDo) {
                // Update existing ToDo
                toDos[index] = toDo
                TodoDataModel.shared.updateTodo(toDo, at: index)
                tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
            } else {
                // Add new ToDo
                toDos.append(toDo)
                TodoDataModel.shared.addTodo(toDo)
                let newIndexPath = IndexPath(row: toDos.count - 1, section: 0)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }

    // MARK: - Handle Checkmark Tap

    func checkmarkTapped(sender: ToDoCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            var toDo = toDos[indexPath.row]
            toDo.isComplete.toggle()
            toDos[indexPath.row] = toDo
            TodoDataModel.shared.updateTodo(toDo, at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }

    // MARK: - Edit Existing ToDo

    @IBSegueAction func editToDo(_ coder: NSCoder, sender: Any?) -> ToDoDetailTableViewController? {
        let detailController = ToDoDetailTableViewController(coder: coder)
        
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            tableView.deselectRow(at: indexPath, animated: true)
            detailController?.toDo = toDos[indexPath.row]
        }
        return detailController
    }
}
