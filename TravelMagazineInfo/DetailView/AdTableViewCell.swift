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
    
    func configureAdCell(data:Travel, bgColor:UIColor) {
        adTitleLabel.text = data.title
        
        adTitleLabel.titlePrimaryLabel(textAlignment: .center, fontSize: 14, textColor: .black)
        
        adLabel.text = " ad "
        adLabel.backgroundColor = .white
        adLabel.layer.cornerRadius = 7
        adLabel.clipsToBounds = true
        bgView.backgroundColor = data.bgView
        bgView.layer.cornerRadius = 10
        
    }
    
}
