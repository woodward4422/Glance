//
//  Float.swift
//  Glance
//
//  Created by Jacob Haff on 11/5/18.
//  Copyright © 2018 Noah Woodward. All rights reserved.
//

import Foundation

extension Float {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}
