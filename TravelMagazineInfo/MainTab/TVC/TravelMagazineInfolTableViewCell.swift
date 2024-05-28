//
//  TravelMagazineInfolTableViewCell.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/26/24.
//

import UIKit

class TravelMagazineInfolTableViewCell:
                                            
                                            
    UITableViewCell {
    @IBOutlet var travelImage: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var subtitleLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(data: Magazine) {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyMMdd"
        
        guard let date = dateformatter.date(from: data.date) else {
            dateLabel.text = data.date
            return  }
        dateformatter.dateFormat = "yy년MM월dd일"
        let formatteddate = dateformatter.string(from: date)
        dateLabel.text = formatteddate
        
        titleLabel.text = data.title
        
        subtitleLabel.text = data.subtitle
        
        let url = URL(string: data.photo_image)
        travelImage.kf.setImage(with:url)
        travelImage.contentMode = .scaleAspectFill
        travelImage.layer.cornerRadius = 10
        travelImage.clipsToBounds = true
        
    }
    
    
    
}
