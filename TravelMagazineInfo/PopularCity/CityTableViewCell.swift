//
//  CityTableViewCell.swift
//  TravelMagazineInfo
//
//  Created by 김윤우 on 5/29/24.
//

import UIKit
import Kingfisher

class CityTableViewCell: UITableViewCell {

    @IBOutlet var cityImage: UIImageView!
    
    @IBOutlet var cityNameLabel: UILabel!
    
    @IBOutlet var cityExplain: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureLayOut()
        
    }
    
    func configureLayOut() {
        
        cityNameLabel.titlePrimaryLabel(textAlignment: .right, fontSize: 20, textColor: .white)
        cityExplain.subtitlePrimaryLabel(textAlignment: .left, fontSize: 16, textColor: .white)
        cityExplain.backgroundColor = .black
        cityExplain.layer.opacity = 0.55
    }
    
    
    
    func configureCell(data: City) {
        
        
        
        let url = URL(string: data.city_image)
        cityImage.kf.setImage(with: url)
        cityImage.contentMode = .scaleAspectFill
        
        cityNameLabel.text = data.city_nameTogether
        cityExplain.text = data.city_explain
        
        
    }
    
}
