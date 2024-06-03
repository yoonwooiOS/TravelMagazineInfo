//
//  UIColor+Extenstion.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 6/4/24.
//

import UIKit

extension UIColor {
    
    static func random() -> UIColor {
        return UIColor(
    red:.random(in: 0...1),
    green: .random(in: 0...1),
    blue:.random(in: 0...1),
    alpha: 1
        )
        
    }
    
    
}

