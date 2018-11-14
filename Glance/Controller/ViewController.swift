//
//  ViewController.swift
//  Glance
//
//  Created by Noah Woodward on 11/3/18.
//  Copyright © 2018 Noah Woodward. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AddTaskViewControllerDelegate {
    
    
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    @IBOutlet weak var taskCollectionView: UICollectionView!
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        taskCollectionView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        taskCollectionView.reloadData()
    }
    
    
    func taskCreated(task:Task){
        print("Delegate worked")
        tasks.append(task)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AddTaskViewController{
            destination.delegate = self
        }
        
    }
    
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "task cell", for: indexPath) as! TaskCollectionViewCell
        let currentTask = tasks[indexPath.row]
        cell.setTitle(title: currentTask.title)
        return cell
    }
}

