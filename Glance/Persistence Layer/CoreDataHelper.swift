//
//  CoreDataHelper.swift
//  Glance
//
//  Created by Noah Woodward on 11/13/18.
//  Copyright © 2018 Noah Woodward. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
   
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static func newTask() -> Task {
        let task = NSEntityDescription.insertNewObject(forEntityName: "Task", into: context) as! Task
        return task
    }
    
    static func saveTasks(){
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
        
    }
    
    static func retrieveTasks() -> [Task] {
        do {
            let fetchRequest = NSFetchRequest<Task>(entityName: "Task")
            let results = try context.fetch(fetchRequest)
            
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
    
    static func createNewTask(title: String, duration: Float,dueDate: Date, colorIndex: Int16) -> Task{
        let newTask = self.newTask()
        newTask.title = title
        newTask.duration = duration
        newTask.dueDate = dueDate
        newTask.colorIndex = colorIndex
        newTask.sliderWidth = 0
        self.saveTasks()
        return newTask
    }
    
    
    
    
    
    
}
