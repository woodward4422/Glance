//
//  Color+Extension.swift
//  Glance
//
//  Created by Noah Woodward on 11/21/18.
//  Copyright © 2018 Noah Woodward. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func getRandomColorIndex() -> Int16 {
        let colors = [#colorLiteral(red: 0.9529411765, green: 0.6, blue: 0.2431372549, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)]
        return Int16(Int.random(in: 0..<colors.count))
    }
    
    static func getColor(index: Int) -> UIColor {
        let colors = [#colorLiteral(red: 0.9529411765, green: 0.6, blue: 0.2431372549, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)]
        return colors[index]
    }
}
