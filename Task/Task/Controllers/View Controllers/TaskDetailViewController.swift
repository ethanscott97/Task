//
//  TaskDetailViewController.swift
//  Task
//
//  Created by Ethan Scott on 4/21/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    
    var task: Task?
    var date: Date?
    
    
//MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let taskName = taskNameTextField.text, !taskName.isEmpty else {return}
        
        if let task = task {
            TaskController.sharedInstance.update(task: task, name: taskName, notes: taskNotesTextView.text ?? nil, dueDate: date ?? nil)
        } else {
            TaskController.sharedInstance.createTaskWith(name: taskName, notes: taskNotesTextView.text ?? nil, dueDate: date ?? nil)
        }
        
        navigationController?.popViewController(animated: true)
              
    }
    
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
        date = taskDueDatePicker.date
    }
    
    func updateViews() {
        guard let task = task else {return}
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        taskDueDatePicker.date = task.dueDate ?? Date()
    }

}
