//
//  UIbuttonExtension.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 6/1/24.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func primaryImageView(urlString:String, contendMode: UIView.ContentMode, cornerRadius:CGFloat ) {
        
        let urlString = URL(string: urlString)
        self.kf.setImage(with: urlString)
        self.contentMode = contendMode
        self.layer.cornerRadius = cornerRadius
       
        
        
        
    }
    
    
    
}
