//
//  UILabelExtention.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/28/24.
//

import UIKit


extension UILabel {
    
    func subtitlePrimaryLabel(textColor color:UIColor) {
        
        self.font = .systemFont(ofSize: 14)
        self.textAlignment = .left
        self.textColor = color
        self.layer.borderColor = UIColor.black.cgColor
        self.numberOfLines = 0

        
    }
}


