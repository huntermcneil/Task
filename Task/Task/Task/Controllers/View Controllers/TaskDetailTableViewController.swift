//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Hunter McNeil on 6/11/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    var task: Task?
    var dueDateValue: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = task?.name
        dueDateTextField.inputView = dueDatePicker
        if let task = task {
            updateViews(task: task)
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let taskName = taskNameTextField.text, !taskName.isEmpty,
            let taskNotes = taskNotesTextView.text
            else {return}
        
        if let task = task {
            TaskController.shared.update(task: task, name: taskName, notes: taskNotes, due: dueDateValue)
        } else {
        TaskController.shared.add(taskWithName: taskName, notes: taskNotes, due: dueDateValue)
        }
        self.navigationController?.popViewController(animated: true)
        tableView.reloadData()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        dueDateTextField.text = dueDatePicker.date.stringValue()
    }
    
    @IBAction func userTappedView(_ sender: UITapGestureRecognizer) {
        taskNameTextField.resignFirstResponder()
        taskNotesTextView.resignFirstResponder()
        dueDateTextField.resignFirstResponder()
    }
    
    
    func updateViews (task: Task) {
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        dueDateTextField.text = task.due?.stringValue()
    }
    
}
