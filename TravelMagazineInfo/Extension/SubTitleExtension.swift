//
//  UILabelExtention.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/28/24.
//

import UIKit

// MARK: 접근 제어자에 대해 알아보자
// 현재 단계에서는 많이 사용하는 것들을 묶어서 편하게 사용한다고 생각
// UILabel 인스턴스가 생성되었을 때 모든 인스턴스들이 접근하는 것이 과연 괜찮은 방법일까?
extension UILabel {
    
    func subtitlePrimaryLabel(textAlignment:NSTextAlignment,   fontSize size:Int,textColor color:UIColor) {
        
        self.font = .systemFont(ofSize: CGFloat(size))
        self.textAlignment = textAlignment
        self.textColor = color
        self.numberOfLines = 0

        
    }
}


