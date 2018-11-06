//
//  AddTaskViewController.swift
//  Glance
//
//  Created by Jacob Haff on 11/5/18.
//  Copyright © 2018 Noah Woodward. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskTitleInput: UITextField!
    
    
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var durationSlider: UISlider!
    
    @IBOutlet weak var estimatedTimeStaticLabel: UILabel!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func createTaskButton(_ sender: Any) {
    }
    
 
    @IBAction func durationValueChanged(_ sender: UISlider) {
        let currentValue = sender.value
        let minValue = sender.minimumValue
        let maxValue - sender.maximumValue
    
    }
    
    
}
