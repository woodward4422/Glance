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
    
    @IBOutlet weak var progressIndicatorView: UIView!
    
    var cellTask = Task()
    
    
    var initialCenter = CGPoint()  // The initial center point of the view.
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGestureRecognizer()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGestureRecognizer()
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        progressIndicatorView.frame.size.width = 50
//
//    }
    
    private func setupGestureRecognizer() {
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panned(_:)))
        self.contentView.addGestureRecognizer(panRecognizer)
    }
    
    @objc func panned(_ gestureRecognizer: UIPanGestureRecognizer) {
        
        guard gestureRecognizer.view != nil else {return}
        
        // Update the position for the .began, .changed, and .ended states
        if gestureRecognizer.state != .cancelled {
            //set the progress indicator's width to the x value of the user's thumb
            progressIndicatorView.frame.size.width = gestureRecognizer.location(in: progressIndicatorView).x
        }
        if gestureRecognizer.state == .ended{
            cellTask.sliderWidth = Float(gestureRecognizer.location(in: progressIndicatorView).x)
            CoreDataHelper.saveTasks()
        }
        
    }
    
    func setTitle(title: String){
        taskNameLabel.text = title 
    }
    
    func setWidth(width: CGFloat,task: Task){
        progressIndicatorView.frame.size.width = CGFloat(task.sliderWidth)
    }
}
