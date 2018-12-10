//
//  TaskCollectionViewCell.swift
//  Glance
//
//  Created by Noah Woodward on 11/12/18.
//  Copyright © 2018 Noah Woodward. All rights reserved.
//

import UIKit
import Foundation

class TaskCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var taskNameLabel: UILabel!
    
    @IBOutlet weak var taskPercentageLabel: UILabel!
    
    @IBOutlet weak var progressIndicatorView: UIView!
    
    @IBOutlet weak var progressViewWidthConstraint: NSLayoutConstraint!
    
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
        if gestureRecognizer.state == .changed {
//            print(String(Int16(progressIndicatorView.frame.size.width / self.frame.size.width) * 100))
//            taskPercentageLabel.text = String(Float(progressIndicatorView.frame.size.width / self.frame.size.width) * 100)
            
            progressViewWidthConstraint.constant = gestureRecognizer.location(in: progressIndicatorView).x
            self.setNeedsLayout()

            
            if(Int((gestureRecognizer.location(in: progressIndicatorView).x / self.frame.size.width * 100)) > 99){
                
                taskPercentageLabel.text = "Finished!"
                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
                    self.transform = CGAffineTransform.identity
                }, completion: nil)
            }
            else{
                taskPercentageLabel.text = String(Int((gestureRecognizer.location(in: progressIndicatorView).x / self.frame.size.width * 100))) + " %"
                cellTask.completionPercentage = Int16(Int((gestureRecognizer.location(in: progressIndicatorView).x / self.frame.size.width * 100)))
            }
            
            if progressIndicatorView.frame.size.width < self.frame.size.width * 0.3{
                progressIndicatorView.backgroundColor =  #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
                cellTask.colorIndex = 0
            }
            else if progressIndicatorView.frame.size.width < self.frame.size.width * 0.6 {
                progressIndicatorView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.6, blue: 0.2431372549, alpha: 1)
                cellTask.colorIndex = 1
            }
            else {
                progressIndicatorView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
                cellTask.colorIndex = 2
 
            }

        }
        
//        if gestureRecognizer.state != .cancelled {
//            //set the progress indicator's width to the x value of the user's thumb
//
//
//
//
//            //            progressIndicatorView.backgroundColor = UIColor(red: ((255-(progressIndicatorView.frame.size.width))/255.0), green: (progressIndicatorView.frame.size.width)/255.0, blue: 0/255.0, alpha: 0.9)
//
//
//
//
//        }
        
        if gestureRecognizer.state == .ended{
//            progressIndicatorView.frame.size.width = gestureRecognizer.location(in: progressIndicatorView).x
//
////            if(cellTask.duration - Float(gestureRecognizer.location(in: progressIndicatorView).x / self.frame.size.width) * cellTask.duration < 0.01){
////                timeLeftLabel.text = "Finished!"
////            }
////            else{
////                var hoursCalc = cellTask.duration - Float(gestureRecognizer.location(in: progressIndicatorView).x / self.frame.size.width) * cellTask.duration
////                hoursCalc = hoursCalc.rounded(toPlaces: 1)
////                print(hoursCalc)
////                timeLeftLabel.text = String(hoursCalc) + " Hours Left "
////            }
//
//            cellTask.sliderWidth = Float(gestureRecognizer.location(in: progressIndicatorView).x)
//            CoreDataHelper.saveTasks()
            
 
            
            cellTask.sliderWidth = Float(gestureRecognizer.location(in: progressIndicatorView).x)
            CoreDataHelper.saveTasks()
        }
        
    }
        
 
    
    func setTitle(title: String){
        taskNameLabel.text = title 
    }
    

}

