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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
