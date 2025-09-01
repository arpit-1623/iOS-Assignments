//
//  AddTaskTableViewController.swift
//  14 - List Guided Project
//
//  Created by Arpit Garg on 01/09/25.
//

import UIKit

class AddTaskTableViewController: UITableViewController {
    
    @IBOutlet weak var isCompletedBUtton: UIButton!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var currentTask: Task?
    
    var isDatePickerHidden = true
    let dateLabelIndexPath = IndexPath(row: 0, section: 1)
    let datePickerIndexPath = IndexPath(row: 1, section: 1)
    let notesIndexPath = IndexPath(row: 0, section: 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentDueDate: Date
        
        if let task = currentTask {
            navigationItem.title = "Edit Task"
            titleField.text = task.title
            isCompletedBUtton.isSelected = task.isComplete
            currentDueDate = task.dueDate
            notesTextView.text = task.notes
        } else {
            currentDueDate = Date().addingTimeInterval(24*60*60)
        }
        
        dueDatePicker.date = currentDueDate
        updateSaveButtonState()
        updateDueDateLabel(date: dueDatePicker.date)
    }
    
    func updateSaveButtonState() {
        let enableSaveButton = titleField.text?.isEmpty == false
        saveButton.isEnabled = enableSaveButton
    }
    
    func updateDueDateLabel(date: Date) {
        dueDateLabel.text = date.formatted(
            .dateTime.month(.defaultDigits).day().year(.twoDigits).hour().minute()
        )
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: sender.date)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
            case datePickerIndexPath where isDatePickerHidden:
                return 0
            case notesIndexPath:
                return 200
            default:
                return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == dateLabelIndexPath {
            isDatePickerHidden.toggle()
            updateDueDateLabel(date: dueDatePicker.date)
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "unwindWithSave" else { return }
        
        let title = titleField.text!
        let isComplete = isCompletedBUtton.isSelected
        let dueDate = dueDatePicker.date
        let notes = notesTextView.text
        
        if currentTask != nil {
            currentTask?.title = title
            currentTask?.isComplete = isComplete
            currentTask?.dueDate = dueDate
            currentTask?.notes = notes
                if let updatedTask = currentTask, let index = tasks.firstIndex(of: updatedTask) {
                    tasks[index] = updatedTask
                    Task.saveTasks(tasks)
                }
        } else {
            currentTask = Task(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
                if let newTask = currentTask {
                    tasks.append(newTask)
                    Task.saveTasks(tasks)
                }
        }
    }
}
