//
//  ExtensionTitleLabel.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/28/24.
//

import UIKit
extension UILabel {
    func titlePrimaryLabel(textColor color:UIColor, fontSize size:Int) {
        
        self.font = .boldSystemFont(ofSize: CGFloat(size))
        self.textAlignment = .left
        self.textColor = color
        self.layer.borderColor = UIColor.black.cgColor
        self.numberOfLines = 0
        
        
    }
}
