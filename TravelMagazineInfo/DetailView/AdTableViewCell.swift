//
//  AdTableViewCell.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/27/24.
//

import UIKit

class AdTableViewCell: UITableViewCell {

    @IBOutlet var bgView: UIView!
    
    @IBOutlet var adTitleLabel: UILabel!
    
    @IBOutlet var adLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func configureAdCell(data:Travel) {
        adTitleLabel.text = data.title
        adLabel.text = " ad "
        adLabel.backgroundColor = .white
        adLabel.layer.cornerRadius = 7
        // true 값 주지 않으면 cornerRadius 안먹음
        adLabel.clipsToBounds = true
        bgView.backgroundColor = randomColor()
        bgView.layer.cornerRadius = 10
        
    }
   
    func randomColor() -> UIColor {
    
        let randomRed = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)
        
        return UIColor(red:randomRed, green: randomGreen, blue: randomBlue, alpha: 0.5)
    }
    
}
