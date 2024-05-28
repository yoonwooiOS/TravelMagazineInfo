//
//  ExtensionTitleLabel.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/28/24.
//

import UIKit
extension UILabel {
    
    func titlePrimaryLabel(textAlignment:NSTextAlignment,   fontSize size:Int,textColor color:UIColor) {
        
        self.font = .boldSystemFont(ofSize: CGFloat(size))
        self.textAlignment = textAlignment
        self.textColor = color
        self.numberOfLines = 0
        
        
    }
}
