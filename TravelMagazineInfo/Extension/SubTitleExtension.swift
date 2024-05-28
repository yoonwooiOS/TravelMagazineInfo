//
//  UILabelExtention.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/28/24.
//

import UIKit


extension UILabel {
    
    func subtitlePrimaryLabel(textAlignment:NSTextAlignment,   fontSize size:Int,textColor color:UIColor) {
        
        self.font = .systemFont(ofSize: CGFloat(size))
        self.textAlignment = textAlignment
        self.textColor = color
        self.numberOfLines = 0

        
    }
}


