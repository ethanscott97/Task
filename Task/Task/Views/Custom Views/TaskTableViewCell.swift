//
//  TaskTableViewCell.swift
//  Task
//
//  Created by Ethan Scott on 4/21/21.
//

import UIKit

//MARK: - Protocol
protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(for cell: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    weak var delegate: TaskCompletionDelegate?
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    
    //MARK: - Actions
    @IBAction func completionButtonTapped(_ sender: Any) {
        
        if let delegate = delegate {
            delegate.taskCellButtonTapped(for: self)
        }
        
    }
    
    func updateViews() {
        guard let task = task else {return}
        
        taskNameLabel.text = task.name
        if task.isComplete {
            completionButton.setBackgroundImage(UIImage(named: "complete"), for: .normal)
        } else {
            completionButton.setBackgroundImage(UIImage(named: "incomplete"), for: .normal)
        }
        
    }
    
}
