//
//  Task.swift
//  Glance
//
//  Created by Noah Woodward on 11/5/18.
//  Copyright © 2018 Noah Woodward. All rights reserved.
//

import Foundation

struct Task{
    var title: String
    var duration: Float
    var dueDate: Date
    
    init(title: String, duration: Float, dueDate: Date){
        self.title = title
        self.duration = duration
        self.dueDate = dueDate
    }
    
}
