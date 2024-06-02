//
//  UIButtonExtension.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 6/2/24.
//

import UIKit
import Kingfisher

extension UIButton {
    
    func primaryButton(imageName:String, imageTitle title: String, backgroundColor bgcolor: UIColor, tintColor: UIColor) {
        
        
        self.setImage(UIImage(systemName: imageName), for: .normal)
        self.setTitle(title, for: .normal)
        self.backgroundColor = bgcolor
        self.tintColor = tintColor
        
        
        
    }
    
    
}
