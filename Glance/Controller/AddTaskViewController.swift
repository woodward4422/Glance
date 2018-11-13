//
//  AddTaskViewController.swift
//  Glance
//
//  Created by Jacob Haff on 11/5/18.
//  Copyright © 2018 Noah Woodward. All rights reserved.
//

import UIKit

protocol AddTaskViewControllerDelegate {
    func taskCreated(task: Task)
}

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskTitleInput: UITextField!
    
    
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var durationSlider: UISlider!
    
    @IBOutlet weak var estimatedTimeStaticLabel: UILabel!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    var actualHours: Float = 0.0
    
    var delegate: AddTaskViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func createTaskButton(_ sender: Any) {
        
        guard let taskTitle = taskTitleInput.text else { fatalError("User did not input task title")}
        
        
        let newTask = Task(title: taskTitle, duration: actualHours, dueDate: dueDatePicker.date)
        
       delegate?.taskCreated(task: newTask)
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
 
    @IBAction func durationValueChanged(_ sender: UISlider) {
        let currentValue = sender.value
    
        let maxHours = 10.0
        
        actualHours = Float(currentValue * Float(maxHours)).rounded(toPlaces: 1)
        
        durationLabel.text = String(actualHours) + " hrs"
        
    }
    

    
    
}
