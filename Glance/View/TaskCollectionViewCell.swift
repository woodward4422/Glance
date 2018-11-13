//
//  TaskCollectionViewCell.swift
//  Glance
//
//  Created by Noah Woodward on 11/12/18.
//  Copyright © 2018 Noah Woodward. All rights reserved.
//

import UIKit

class TaskCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var taskNameLabel: UILabel!
    
    func setTitle(title: String){
        taskNameLabel.text = title 
    }
}
