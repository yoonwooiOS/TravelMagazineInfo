//
//  TravelMagazineInfoTableViewCell.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 6/1/24.
//

import UIKit

class TravelMagazineInfoTableViewCell: UITableViewCell {
    
    @IBOutlet var travelInfoImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var describeLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureLayOut()
        
        
    }
    
    func configureLayOut() {
        
        titleLabel.titlePrimaryLabel(textAlignment: .left, fontSize: 20, textColor: .black)
        describeLabel.subtitlePrimaryLabel(textAlignment: .left, fontSize: 14, textColor: .lightGray)
        
        
    }
    
    func configureCell(data: Magazine) {
       
        travelInfoImageView.primaryImageView(urlString: data.photo_image, contendMode: .scaleToFill, cornerRadius: 10)
        
        titleLabel.text = data.title
        
        describeLabel.text = data.subtitle
        
        dataFomatter(data: data)
    }
    
    
    func dataFomatter(data: Magazine) {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyMMdd"
        
        guard let date = dateformatter.date(from: data.date) else {
            dateLabel.text = data.date
            return   }
        
        dateformatter.dateFormat = "yy년MM월dd일"
        let formatteddate = dateformatter.string(from: date)
        dateLabel.text = formatteddate
        dateLabel.subtitlePrimaryLabel(textAlignment: .right, fontSize: 14, textColor: .systemGray2)
        
     
    }
   
    
}
