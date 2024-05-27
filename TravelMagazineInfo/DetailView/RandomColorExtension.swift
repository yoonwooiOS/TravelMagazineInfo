//
//  RandomColorExtension.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/27/24.
//

import UIKit

extension UIColor {
    func randomColor() -> UIColor {
    
        let randomRed = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)
        
        return UIColor(red:randomRed, green: randomGreen, blue: randomBlue, alpha: 0.5)
    }
}
